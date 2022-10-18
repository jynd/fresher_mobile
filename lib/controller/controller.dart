import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:training_flutter/screens/buy_at_store_screen.dart';

class Controller extends ChangeNotifier {
  Barcode? resultBarCode;
  Barcode? resultQrCode;
  QRViewController? controller;
  bool isDeCrease = true;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      resultBarCode = scanData;
      if (resultBarCode != null) {
        controller.pauseCamera();
      }
      notifyListeners();
    });
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

  void onQRViewCreatedQrCode(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      resultQrCode = scanData;
      if (resultQrCode != null) {
        controller.pauseCamera();
        resultQrCode = scanData;
      }
      notifyListeners();
    });
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
}
