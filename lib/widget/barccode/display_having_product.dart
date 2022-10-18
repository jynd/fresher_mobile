import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../../theme/color.dart';

class DisplayHavingProduct extends StatefulWidget {
  const DisplayHavingProduct({super.key});

  @override
  State<DisplayHavingProduct> createState() => _DisplayCartState();
}

class _DisplayCartState extends State<DisplayHavingProduct> {
  Controller get readScannerProduct => context.read<Controller>();
  Controller get watchScannerProduct => context.watch<Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: disPlayCarts(),
    );
  }

  Widget disPlayCarts() {
    double height = MediaQuery.of(context).size.height;
    return (watchScannerProduct.resultBarCode != null)
        ? Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            width: MediaQuery.maybeOf(context)?.size.width,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Giỏ hàng',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                    'Bạn đang có ${watchScannerProduct.getCount} sản phẩm trong giỏ hàng',
                    style: TextStyle(fontWeight: FontWeight.w400)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'images/logoo.jpg',
                      width: 40,
                      height: 40,
                    ),
                    Image.asset(
                      'images/logoo.jpg',
                      width: 40,
                      height: 40,
                    ),
                    Image.asset(
                      'images/logoo.jpg',
                      width: 40,
                      height: 40,
                    ),
                    Expanded(
                        child: Container(
                      width: 50,
                      height: 36,
                      margin: const EdgeInsets.only(right: 20, left: 28),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: colorButton),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 28)),
                            const Padding(padding: EdgeInsets.only(left: 30)),
                            const Text(
                              'Mua ngay',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            width: MediaQuery.maybeOf(context)?.size.width,
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Giỏ hàng',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Bạn đang có 0 sản phẩm trong giỏ hàng',
                    style: TextStyle(fontWeight: FontWeight.w400)),
              ],
            ),
          );
  }
}
