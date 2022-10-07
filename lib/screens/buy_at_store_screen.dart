import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_flutter/screens/scanner_qr_product_screen.dart';

import '../theme/color.dart';

class BuyAtStoreScreen extends StatelessWidget {
  const BuyAtStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: colorAppBar,
          title: const Text(
            'Mua tại cửa hàng ',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset('images/store.svg'),
                title: const Text('Địa chỉ nhận hàng'),
                subtitle: const Text('Bibo Mart Trung Kính -193 Trung Kính'),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
              ),
              ListTile(
                leading: SvgPicture.asset('images/sale.svg'),
                title: const Text('Ưu đãi của bạn'),
                subtitle: const Text(
                  'Mua sắm càng nhiều, ưu đãi càng "khủng"',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_next),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 256,
                height: 36,
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colorButton),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScannerQRProduct()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 10)),
                        SvgPicture.asset('images/icon_scanner.svg'),
                        const Padding(padding: EdgeInsets.only(left: 30)),
                        const Text(
                          'Quét mã sản phẩm',
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
              ),
              const SizedBox(height: 420),
              Container(
                padding: EdgeInsets.all(10),
                width: 380,
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Giỏ hàng',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Bạn đang có 0 sản phẩm trong giỏ hàng',
                        style: TextStyle(fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
