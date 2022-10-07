import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../theme/color.dart';

class ScannerQRProduct extends StatefulWidget {
  const ScannerQRProduct({super.key});

  @override
  State<ScannerQRProduct> createState() => _ScannerQRProductState();
}

class _ScannerQRProductState extends State<ScannerQRProduct> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorAppBar,
        title: const Text(
          'Quét mã sản phẩm ',
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset('images/flash_pro.svg'),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(bottom: 70, child: buildRs()),
          // Positioned(bottom: 100, child: cart())
        ],
      ),
    );
  }

  Widget cart() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 352,
      height: 228,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Sản phẩm đã quét',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/logoo.jpg',
                width: 78,
                height: 78,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                        'Bột dinh dưỡng Hppi hoa quả, sữa và bắp 250g (Trên 6 tháng)'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('80000đ'),
                        Container(
                          margin: const EdgeInsets.only(left: 80),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              const Text('3'),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 256,
            height: 36,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: colorButton),
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Icon(Icons.add_circle_outline),
                  const Padding(padding: EdgeInsets.only(left: 30)),
                  const Text(
                    'Thêm vào giỏ hàng',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRs() {
    return (result != null)
        ? cart()
        : Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Di chuyển camera chính \n giữa QR Code để quét',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              // const SizedBox(height: 40),
              Container(
                width: 213,
                height: 48,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(right: 20)),
                    SvgPicture.asset('images/icon_code_store.svg'),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          child: const Text(
                            'Nhập mã sản phẩm',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: ((context) =>
                            //         const EnterCodeScreen()))
                            //         );
                          },
                        ))
                  ],
                ),
              )
            ],
          );
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      overlay: QrScannerOverlayShape(
          borderRadius: 16,
          borderWidth: 6,
          cutOutSize: MediaQuery.of(context).size.width * 0.7),
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
