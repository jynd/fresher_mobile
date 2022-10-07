import 'package:flutter/material.dart';

bool isObscurePassword = true;
Widget buildTextField(String labelText, String placeholder, bool readOnly,
    TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
          fillColor: Color(0xffD9D9D9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 5, left: 5, top: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 16, color: Colors.black)),
    ),
  );
}
