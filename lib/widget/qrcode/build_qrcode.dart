import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/controller.dart';
import '../../controller/controller_qrcode.dart';
import 'disPlay_result_qrcode.dart';
import 'display_having_product_qrcode.dart';

class BuildQrCode extends StatefulWidget {
  const BuildQrCode({super.key});

  @override
  State<BuildQrCode> createState() => _ScannerQRProductState();
}

class _ScannerQRProductState extends State<BuildQrCode> {
  ControllerQrCode get readScannerProduct => context.read<ControllerQrCode>();
  ControllerQrCode get watchScannerProduct => context.watch<ControllerQrCode>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      readScannerProduct.controller!.pauseCamera();
    } else if (Platform.isIOS) {
      readScannerProduct.controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          const Positioned(bottom: 170, child: DisPlayResultQrCode()),
          // const Positioned(bottom: 10, child: DisplayHavingProductQrCode()),

          // Positioned(bottom: 100, child: cart())
        ],
      ),
    ));
  }

  Widget buildQRView(BuildContext context) {
    return QRView(
      onPermissionSet: (controller, permisson) =>
          readScannerProduct.onPermissionSet(context, controller, permisson),
      overlay: QrScannerOverlayShape(
          borderRadius: 16,
          borderWidth: 6,
          cutOutSize: MediaQuery.of(context).size.width * 0.7),
      key: qrKey,
      onQRViewCreated: (QRViewController controller) =>
          readScannerProduct.onQRViewCreated(controller),
    );
  }

  @override
  void dispose() {
    readScannerProduct.controller?.dispose();
    super.dispose();
  }
}
