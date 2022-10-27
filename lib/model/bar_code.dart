import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Barcodee extends ChangeNotifier {
  Barcode? barcode;
  QRViewController? controller;
  bool isToggle;
  Barcodee({this.barcode, this.controller, this.isToggle = false});
  void isToggleFlash() {
    isToggle = !isToggle;
    print('object${isToggle}');
    notifyListeners();
  }
}
