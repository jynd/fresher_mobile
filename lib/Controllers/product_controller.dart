import 'package:flutter/material.dart';
import 'package:training_flutter/Models/product_model.dart';
import 'package:training_flutter/Widgets/add_children.dart';

class ProductController extends ChangeNotifier {
  // final List<ProductModel> _list = <ProductModel>[];
  // List<ProductModel> get list => _list;
  late int index = 0;
  List<TextEditingController> nameChildAddcontroller = [];
  final List<DynamicWidget> listDynamic = [];
  addDynamic(TextEditingController controller, int index) {
    listDynamic.add(DynamicWidget(
      index: 1,
    ));
    this.index++;
    nameChildAddcontroller.add(controller);
    controller.text = "";
    notifyListeners();
  }

  final List<ProductModel> list = <ProductModel>[
    ProductModel(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiUSN4K9DpzOG_bdneob8ysK5ZSu1efzOvCw&usqp=CAU',
        'Tô Ny Sờ Tắc',
        DateTime.utc(2002, 09, 23),
        'Nam',
        'stack@gmail.com',
        'New York',
        08112313131,
        <ChildModel>[ChildModel("Ải ron ú mèn", DateTime.now(), "Nữ")])
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

  void removeChild(int index) {
    listDynamic.removeAt(index);
    notifyListeners();
  }
}
