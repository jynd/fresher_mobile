import 'package:flutter/material.dart';

bool isObscurePassword = true;
Widget buildTextField(
    String placeholder, bool readOnly, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        fillColor: const Color(0xfffbfbfb),
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(bottom: 5, left: 5, top: 5),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Xin điền đủ thông tin!";
        } else {
          return null;
        }
      },
    ),
  );
}
