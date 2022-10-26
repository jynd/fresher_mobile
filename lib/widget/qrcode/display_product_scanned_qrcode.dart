import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../../controller/controller_qrcode.dart';
import '../../theme/color.dart';

class DisplayProductScannedQrCode extends StatefulWidget {
  const DisplayProductScannedQrCode({super.key});

  @override
  State<DisplayProductScannedQrCode> createState() => _DisplayCartState();
}

class _DisplayCartState extends State<DisplayProductScannedQrCode> {
  ControllerQrCode get readScannerProduct => context.read<ControllerQrCode>();
  ControllerQrCode get watchScannerProduct => context.watch<ControllerQrCode>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cart(),
    );
  }

  Widget cart() {
    return (readScannerProduct.mListQrCode.isNotEmpty)
        ? Container(
            margin: const EdgeInsets.only(left: 8, top: 100),
            width: 352,
            height: 228,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      child: const Text(
                        'Cửa hàng đã quét',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          readScannerProduct.clearProduct();
                        },
                        icon: const Icon(Icons.close)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Image.network(
                  'https://th.bing.com/th/id/OIP.ypB0bokOy82FVhKFg2fvUQHaEo?w=289&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7',
                  width: MediaQuery.of(context).size.width,
                  height: 78,
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Bibo Mart Trung Kính -193 Trung Kính',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: 256,
                //   height: 36,
                //   margin: const EdgeInsets.only(right: 20, left: 20),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(primary: colorButton),
                //     onPressed: () async {
                //       readScannerProduct.resumeCamera();
                //       print('object');
                //     },
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       // ignore: prefer_const_literals_to_create_immutables
                //       children: [
                //         const Padding(padding: EdgeInsets.only(left: 10)),
                //         const Icon(Icons.add_circle_outline),
                //         const Padding(padding: EdgeInsets.only(left: 30)),
                //         const Text(
                //           'Thêm vào giỏ hàng',
                //           textAlign: TextAlign.center,
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          )
        : const Visibility(
            visible: false,
            child: Text(
              "two",
            ),
          );
  }
}
