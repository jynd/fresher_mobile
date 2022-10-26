import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../../screens/enter_code_screen.dart';
import 'display_product_scanned.dart';

class DisPlayResult extends StatefulWidget {
  const DisPlayResult({super.key});

  @override
  State<DisPlayResult> createState() => _DisPlayResultState();
}

class _DisPlayResultState extends State<DisPlayResult> {
  Controller get readScannerProduct => context.read<Controller>();
  Controller get watchScannerProduct => context.watch<Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: disPlayResult(),
    );
  }

  Widget disPlayResult() {
    if (watchScannerProduct.mList.isNotEmpty) {
      return const DisplayProductScanned();
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
