import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:training_flutter/controller/controller_qrcode.dart';
import 'package:training_flutter/screens/qr_code_store_screen.dart';
import 'package:training_flutter/widget/qrcode/display_product_scanned_qrcode.dart';
import '../../controller/controller.dart';
import '../../screens/enter_code_screen.dart';
import '../../theme/font.dart';
import '../barccode/display_product_scanned.dart';

class DisPlayResultQrCode extends StatefulWidget {
  const DisPlayResultQrCode({super.key});

  @override
  State<DisPlayResultQrCode> createState() => _DisPlayResultState();
}

class _DisPlayResultState extends State<DisPlayResultQrCode> {
  ControllerQrCode get readScannerProduct => context.read<ControllerQrCode>();
  ControllerQrCode get watchScannerProduct => context.watch<ControllerQrCode>();
  @override
  Widget build(BuildContext context) {
    return Container(child: disPlayResult(context));
  }

  Widget disPlayResult(BuildContext context) {
    if (watchScannerProduct.mListQrCode.isNotEmpty) {
      return const DisplayProductScannedQrCode();
    } else {
      return Column(
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
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(right: 20)),
                SvgPicture.asset('images/icon_code_store.svg'),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () {
                        readScannerProduct.showBottomSheet(context);
                        readScannerProduct.controller?.pauseCamera();
                      },
                      child: const Text(
                        'Quét mã sản phẩm ',
                      ),
                    ))
              ],
            ),
          )
        ],
      );
    }
  }
}
