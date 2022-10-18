import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:training_flutter/screens/scanner_qr_product_screen.dart';

import '../controller/controller.dart';
import '../theme/color.dart';

class BuyAtStoreScreen extends StatefulWidget {
  const BuyAtStoreScreen({super.key});

  @override
  State<BuyAtStoreScreen> createState() => _BuyAtStoreScreenState();
}

class _BuyAtStoreScreenState extends State<BuyAtStoreScreen> {
  Controller get readController => context.read<Controller>();
  Controller get watchScannerProduct => context.watch<Controller>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

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
      body: Column(
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
                  print('cmmm');
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
          const SizedBox(height: 500),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.maybeOf(context)?.size.width,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('Giỏ hàng',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                (watchScannerProduct.resultBarCode != null)
                    ? Text(
                        'Bạn đang có ${watchScannerProduct.getCount} sản phẩm trong giỏ hàng',
                        style: TextStyle(fontWeight: FontWeight.w400))
                    : const Text('Bạn đang có 0 sản phẩm trong giỏ hàng',
                        style: TextStyle(fontWeight: FontWeight.w400))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
