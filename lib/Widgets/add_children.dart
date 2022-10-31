import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/product_controller.dart';
import 'build_textfield.dart';
import 'package:intl/intl.dart';

class DynamicWidget extends StatefulWidget {
  final int? index;
  const DynamicWidget({Key? key, this.index}) : super(key: key);

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  ProductController get _watch => context.watch<ProductController>();
  ProductController get _read => context.read<ProductController>();
  String itemsexe = "";
  final TextEditingController _dateController = TextEditingController();
  var listItem = ['Nam', 'Nữ'];
  var currentItemSelected = 'Nam';
  bool isExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 1; i < 75; i++) {
      _read.nameChildAddcontroller.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Thông tin con thứ ${widget.index! + 2} ",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.highlight_remove,
                    color: Color(0xffF12C2C),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Đã xóa con thứ ${widget.index! + 2}!"),
                      duration: const Duration(seconds: 1),
                    ));
                    _read.removeChild(widget.index!);
                  },
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Họ và tên',
                  style: TextStyle(color: Colors.grey),
                )),
            buildTextField("Họ và tên", false,
                _read.nameChildAddcontroller[widget.index!]),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ngày sinh',
                  style: TextStyle(color: Colors.grey),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Xin điền đủ thông tin!';
                  }
                  return null;
                },
                controller: _dateController,
                decoration: const InputDecoration(
                  suffixIcon: ImageIcon(
                    AssetImage('assets/datetime.png'),
                  ),
                  fillColor: Color(0xfffbfbfb),
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 5, left: 5, top: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Ngày Sinh',
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now());
                  if (pickeddate != null) {
                    setState(() {
                      _dateController.text =
                          DateFormat('dd/MM/yyyy').format(pickeddate);
                    });
                  }
                },
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Giới tính',
                  style: TextStyle(color: Colors.grey),
                )),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 30),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  fillColor: Color(0xfffbfbfb),
                  filled: true,
                  border: InputBorder.none,
                ),
                items: listItem.map((String newValue) {
                  return DropdownMenuItem<String>(
                    value: newValue,
                    child: Text(newValue),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    currentItemSelected = newValueSelected!;
                  });
                },
                value: currentItemSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
