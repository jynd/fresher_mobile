import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_flutter/controller/controller.dart';
import 'package:training_flutter/screens/buy_at_store_screen.dart';
import 'package:training_flutter/screens/qr_code_store_screen.dart';
import 'package:training_flutter/screens/scanner_qr_product_screen.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Controller())],
      child: const MyHome(),
    ));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const QRCodeScreen()));
                },
                child: const Text('Quét mã cửa hàng')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const BuyAtStoreScreen()));
                },
                child: const Text('Mua tại cửa hàng'))
          ],
        ),
      ),
    );
  }
}
