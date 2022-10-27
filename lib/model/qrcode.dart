import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCode extends ChangeNotifier {
  Barcode? barcode;
  QRViewController? controller;
  bool isToogle;
  QrCode({this.barcode, this.controller, this.isToogle = false});
  void isToggleFlash() {
    isToogle = !isToogle;
    notifyListeners();
  }
}
