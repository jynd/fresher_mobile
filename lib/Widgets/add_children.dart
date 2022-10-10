import 'package:flutter/material.dart';

import '../Screens/acount_info_screen.dart';
import 'build_textfield.dart';
import 'package:intl/intl.dart';

class DynamicWidget extends StatefulWidget {
  final int? index;
  const DynamicWidget({Key? key, this.index}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  String itemsexe = "";
  TextEditingController _dateController = TextEditingController();
  var listItem = ['Nam', 'Nữ'];
  var currentItemSelected = 'Nam';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Text(
              "Thông tin con thứ ${widget.index! + 2} ",
              style: TextStyle(fontSize: 18),
            ),
            trailing: IconButton(
              icon: isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Họ và tên',
                        style: TextStyle(color: Colors.grey),
                      )),
                  buildTextField(
                      "Họ và tên", false, TextEditingController(text: null)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ngày sinh',
                        style: TextStyle(color: Colors.grey),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        suffixIcon: ImageIcon(
                          AssetImage('assets/datetime.png'),
                        ),
                        fillColor: Color(0xfffbfbfb),
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(bottom: 5, left: 5, top: 5),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Ngày Sinh',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickeddate != null) {
                          setState(() {
                            _dateController.text =
                                DateFormat('dd/MM/yyyy').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Giới tính',
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 30),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Color(0xfffbfbfb),
                        filled: true,
                        border: InputBorder.none,
                      ),
                      items: listItem.map((String newValue) {
                        return DropdownMenuItem<String>(
                          child: Text(newValue),
                          value: newValue,
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          this.currentItemSelected = newValueSelected!;
                        });
                      },
                      value: currentItemSelected,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
