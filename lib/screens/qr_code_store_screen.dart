import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:training_flutter/screens/enter_code_screen.dart';
import 'package:training_flutter/theme/color.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<QRCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorAppBar,
        title: const Text(
          'Quét mã cửa hàng ',
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                buildQRView(context);
              },
              child: SvgPicture.asset('images/flash.svg'),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(bottom: 70, child: buildRs())
        ],
      ),
    );
  }

  Widget buildRs() {
    return (result != null)
        ? Text(
            'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
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
                            'Nhập mã cửa hàng',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    const EnterCodeScreen())));
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
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8),
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
