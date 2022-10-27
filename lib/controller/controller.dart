import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:training_flutter/model/bar_code.dart';
import 'package:training_flutter/model/qrcode.dart';
import 'package:training_flutter/screens/buy_at_store_screen.dart';
import '../theme/font.dart';

class Controller extends ChangeNotifier {
  Barcode? resultBarCode;

  QRViewController? controller;
  bool isDeCrease = true;
  List<Barcodee> mList = [];

  final _formKey = GlobalKey<FormState>();

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      resultBarCode = scanData;
      if (resultBarCode != null) {
        controller.pauseCamera();
        addBarcode();
        print('lsitt${mList.length}');
      }
      notifyListeners();
    });
  }

  void addBarcode() {
    Barcodee qrCode = Barcodee(barcode: resultBarCode, controller: controller);
    mList.add(qrCode);
    notifyListeners();
  }

  void clearProduct() {
    controller?.resumeCamera();
    mList.clear();
    notifyListeners();
  }

  int count = 3;
  get getCount => count;
  void increase() {
    count++;
    notifyListeners();
    return;
  }

  void deIncrease() {
    count--;
    if (count == 1) {
      print('coung${count}');
      return;
    }
    notifyListeners();
  }

  void resumeCamera() {
    if (resultBarCode != null) {
      controller?.resumeCamera();
    }

    notifyListeners();
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, p) {
    if (!p) {
      showMaterialDialog(context);
      notifyListeners();
    }
    controller?.resumeCamera();
  }

  void showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text(
                'Bạn chưa cấp quyền truy cập camera, vui lòng cấp quyền truy cập camera để quét mã'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    print('dong');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const BuyAtStoreScreen()));
                  },
                  child: const Text('Đóng')),
              TextButton(
                onPressed: () {
                  openAppSettings();
                },
                child: const Text('Cấp quyền'),
              )
            ],
          );
        });
  }

  void showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: ctx,
        builder: (ctx) => Padding(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(ctx).pop;
                          },
                          icon: const Icon(Icons.close)),
                      const Text(
                        'Nhập mã',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _validateForm();
                                  },
                                  child: const Icon(Icons.arrow_forward),
                                ),
                                labelStyle: MyTextStyle().textSub,
                                labelText: 'Mã cửa hàng',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Không có dữ liệu ';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _validateForm();
                      },
                      child: const Text('Xong'))
                ],
              ),
            ));
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {}
  }
}
