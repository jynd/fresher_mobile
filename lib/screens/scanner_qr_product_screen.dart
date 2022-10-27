import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../controller/controller.dart';
import '../model/bar_code.dart';
import '../theme/color.dart';
import '../widget/barccode/build_barcode.dart';

class ScannerQRProduct extends StatefulWidget {
  const ScannerQRProduct({super.key});

  @override
  State<ScannerQRProduct> createState() => _ScannerQRProductState();
}

class _ScannerQRProductState extends State<ScannerQRProduct> {
  Controller get readScannerProduct => context.read<Controller>();
  Barcodee get readBarcodeController => context.read<Barcodee>();
  Barcodee get watchBarcodeController => context.watch<Barcodee>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                onTap: () async {
                  readBarcodeController.isToggleFlash();
                  readScannerProduct.controller?.toggleFlash();
                },
                child: watchBarcodeController.isToggle
                    ? SvgPicture.asset('images/flash.svg')
                    : SvgPicture.asset('images/flash_pro.svg'),
              ),
            )
          ],
        ),
        body: const BuildBarcode());
  }
}
