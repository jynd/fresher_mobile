import 'package:flutter/material.dart';

class ProductModel {
  String? avatar;
  String name;
  DateTime birthday;
  String sexe;
  String email;
  String address;
  int telenumber;
  // List<ChildModel> listcon;

  ProductModel(this.avatar,this.name, this.birthday, this.sexe, this.email, this.address,
      this.telenumber);
}

// class ChildModel {
//   String nameChild;
//   DateTime birthdayChild;
//   String sexeChild;
//
//   ChildModel(this.nameChild, this.birthdayChild, this.sexeChild);
// }
