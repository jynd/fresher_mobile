import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../../theme/color.dart';

class DisplayProductScanned extends StatefulWidget {
  const DisplayProductScanned({super.key});

  @override
  State<DisplayProductScanned> createState() => _DisplayCartState();
}

class _DisplayCartState extends State<DisplayProductScanned> {
  Controller get readScannerProduct => context.read<Controller>();
  Controller get watchScannerProduct => context.watch<Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cart(),
    );
  }

  Widget cart() {
    return (readScannerProduct.mList.isNotEmpty)
        ? Container(
            margin: const EdgeInsets.only(left: 8, top: 100),
            width: 352,
            height: 228,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 17,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      child: const Text(
                        'Sản phẩm đã quét',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {
                            readScannerProduct.clearProduct();
                          },
                          icon: const Icon(Icons.close)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                                        onPressed: () {
                                          readScannerProduct.deIncrease();
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text('${watchScannerProduct.getCount}'),
                                    IconButton(
                                        onPressed: () {
                                          readScannerProduct.increase();
                                        },
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
                  margin:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colorButton),
                    onPressed: () async {
                      // await readScannerProduct?.controller?.toggleFlash;
                      // print('object');
                    },
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
                ),
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
