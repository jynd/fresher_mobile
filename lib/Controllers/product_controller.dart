import 'package:flutter/material.dart';
import 'package:training_flutter/Models/product_model.dart';

class ProductController extends ChangeNotifier {
  // final List<ProductModel> _list = <ProductModel>[];
  // List<ProductModel> get list => _list;
  List<TextEditingController> nameChildAddcontroller = [];

  List<ProductModel> list = [
    ProductModel('Tô Ny Sờ Tắc',DateTime.utc(2002, 09, 23), 'Nam', 'stack@gmail.com',
        'New York', 08112313131)
  ];



  // void update(int index, String name, DateTime bir, String emai, String adr, String sexe, int tlnumber){
  //     int index = list.indexWhere((element) => element?.name == name);
  //     list[index].birthday = bir;
  //     list[index].email = emai;
  //     list[index].address = adr;
  //     list[index].sexe = sexe;
  //     list[index].telenumber = tlnumber;
  //     notifyListeners();
  // }
}
