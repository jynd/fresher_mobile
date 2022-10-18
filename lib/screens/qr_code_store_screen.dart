import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:training_flutter/controller/controller.dart';
import 'package:training_flutter/screens/enter_code_screen.dart';
import 'package:training_flutter/theme/color.dart';

import '../widget/qrcode/build_qrcode.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  State<QRCodeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<QRCodeScreen> {
  Controller get controller => context.read<Controller>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: colorAppBar,
          title: const Text(
            'Quét mã cửa hàng ',
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset('images/flash.svg'),
              ),
            )
          ],
        ),
        body: const BuildQrCode());
  }
}
