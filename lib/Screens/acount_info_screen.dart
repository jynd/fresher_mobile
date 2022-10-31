import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:training_flutter/Controllers/product_controller.dart';
import 'package:training_flutter/Models/product_model.dart';
import 'package:training_flutter/Widgets/build_textfield.dart';
import 'package:intl/intl.dart';

import '../Widgets/add_children.dart';

class AcountInfoScreen extends StatefulWidget {
  final DynamicWidget? dynamicWidget;
  const AcountInfoScreen({Key? key, this.dynamicWidget}) : super(key: key);
  @override
  State<AcountInfoScreen> createState() => _AcountInfoScreenState();
}

class _AcountInfoScreenState extends State<AcountInfoScreen> {
  File? image;
  var currentItemSelected;
  var currentItemSelected2;
  var formatDate = DateFormat("dd/MM/yyyy");
  var formatDate2 = DateFormat("yyyy");
  var date = DateTime.now().year;
  late int age = 0;
  ProductController get _watch => context.watch<ProductController>();
  ProductController get _read => context.read<ProductController>();
  DynamicWidget get _readDynamic => context.read<DynamicWidget>();
  String itemsexe = "";
  var listItem = ['Nam', 'Nữ'];
  bool isExpanded = false;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailTextField = TextEditingController();
  final TextEditingController _sexeTextField = TextEditingController();
  final TextEditingController _addressTextField = TextEditingController();
  final TextEditingController _tlnumberTextField = TextEditingController();
  final TextEditingController _nameTextField = TextEditingController();
  final TextEditingController _nameChildTextField = TextEditingController();
  final TextEditingController _dateChildController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late int selectedYear = _read.list[0].birthday.year;
  void caculateAge() {
    age = date - selectedYear;
  }

  void requestPicturePermisstion() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      pickImage(ImageSource.gallery);
      print("Permission is granted");
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Hãy cấp quyền để chọn ảnh'),
        duration: Duration(seconds: 1),
      ));
      if (await Permission.storage.request().isGranted) {
        print('Permission was granted');
        pickImage(ImageSource.gallery);
      }
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      currentItemSelected = _read.list[0].sexe;
      _emailTextField.text = _read.list[0].email;
      _dateController.text =
          formatDate.format(DateTime.parse(_read.list[0].birthday.toString()));
      _addressTextField.text = _read.list[0].address;
      _sexeTextField.text = _read.list[0].sexe;
      _tlnumberTextField.text = _read.list[0].telenumber.toString();
      _nameTextField.text = _read.list[0].name;
      _nameChildTextField.text = _read.list[0].listcon[0].nameChild;
      _dateChildController.text = formatDate.format(
          DateTime.parse(_read.list[0].listcon[0].birthdayChild.toString()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD12805),
        title: const Text('Thông tin tài khoản'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    (image != null)
                        ? ClipOval(
                            child: Image.file(
                            image!,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          ))
                        : ClipOval(
                            child: Image.network(
                            _watch.list[0].avatar ?? "",
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          )),
                    Positioned(
                        top: 110,
                        left: 200,
                        child: MaterialButton(
                          height: 50,
                          onPressed: requestPicturePermisstion,
                          color: const Color(0xffF12C2C),
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Họ và tên',
                            style: TextStyle(color: Colors.grey),
                          )),
                      buildTextField(_watch.list[0].name, true, _nameTextField),
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
                          decoration: InputDecoration(
                            suffixIcon: const ImageIcon(
                              AssetImage('assets/datetime.png'),
                            ),
                            fillColor: const Color(0xfffbfbfb),
                            filled: true,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                bottom: 5, left: 5, top: 15),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText:
                                formatDate.format(_watch.list[0].birthday),
                          ),
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime.now());
                            if (pickeddate != null) {
                              _dateController.text =
                                  DateFormat('dd/MM/yyyy').format(pickeddate);
                              selectedYear = pickeddate.year;
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
                          decoration: InputDecoration(
                            hintText: _watch.list[0].sexe,
                            fillColor: const Color(0xfffbfbfb),
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
                            // setState(() {
                            currentItemSelected = newValueSelected!;
                            // });
                          },
                          value: currentItemSelected,
                        ),
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(color: Colors.grey),
                          )),
                      TextFormField(
                        controller: _emailTextField,
                        decoration: InputDecoration(
                          fillColor: const Color(0xfffbfbfb),
                          filled: true,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(bottom: 5, left: 5, top: 5),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: _watch.list[0].email,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Xin điền đủ thông tin!";
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "xin nhập đúng định dạng email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Địa chỉ',
                            style: TextStyle(color: Colors.grey),
                          )),
                      buildTextField(
                          _watch.list[0].address, false, _addressTextField),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Số điện thoại',
                            style: TextStyle(color: Colors.grey),
                          )),
                      TextFormField(
                        readOnly: true,
                        controller: _tlnumberTextField,
                        decoration: InputDecoration(
                          fillColor: const Color(0xfffbfbfb),
                          filled: true,
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(bottom: 5, left: 5, top: 5),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: _watch.list[0].telenumber.toString(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Xin điền đủ thông tin!";
                          } else if (value.length != 10) {
                            return "Số điện thoại chỉ có 10 số";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(children: const [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Thông tin con thứ 1",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: IconButton(
                        //       icon: isExpanded
                        //           ? const Icon(Icons.expand_more)
                        //           : const Icon(Icons.expand_less),
                        //       onPressed: () {
                        //         setState(() {
                        //           isExpanded = !isExpanded;
                        //         });
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Họ và tên',
                                style: TextStyle(color: Colors.grey),
                              )),
                          buildTextField(
                              "Họ và tên", false, _nameChildTextField),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Ngày sinh',
                                style: TextStyle(color: Colors.grey),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: TextFormField(
                              controller: _dateChildController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Xin điền đủ thông tin!';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                suffixIcon: ImageIcon(
                                  AssetImage('assets/datetime.png'),
                                ),
                                fillColor: Color(0xfffbfbfb),
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    bottom: 5, left: 5, top: 15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Ngày Sinh',
                              ),
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now());
                                if (pickeddate != null) {
                                  // setState(() {
                                  _dateChildController.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(pickeddate);
                                  // });
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
                              decoration: InputDecoration(
                                hintText: _watch.list[0].listcon[0].sexeChild,
                                fillColor: const Color(0xfffbfbfb),
                                filled: true,
                                hintStyle: const TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                              items: listItem.map((String newValue) {
                                return DropdownMenuItem<String>(
                                  value: newValue,
                                  child: Text(newValue),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                // setState(() {
                                currentItemSelected2 = newValueSelected!;
                                // });
                              },
                              value: currentItemSelected2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _read.listDynamic.length,
                              itemBuilder: (_, index) =>
                                  DynamicWidget(index: index),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            MaterialButton(
                              elevation: 0,
                              color: Colors.white,
                              shape: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffF12C2C)),
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                _read.addDynamic();
                                _nameChildTextField.text = '';
                                // _read.Clear();
                                print(_read.nameChildAddcontroller);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_circle_outlined,
                                    color: Color(0xffF12C2C),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Thêm thông tin con",
                                    style: TextStyle(color: Color(0xffF12C2C)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialButton(
                              color: const Color(0xffF12C2C),
                              elevation: 0,
                              shape: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffF12C2C)),
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                caculateAge();
                                if (!_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Điền thiếu thông tin!'),
                                    duration: Duration(seconds: 1),
                                  ));
                                } else if (age < 18) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Chưa đủ 18 tuổi'),
                                    duration: Duration(seconds: 1),
                                  ));
                                  print(age);
                                  print(selectedYear);
                                  print(date);
                                  print(_read.nameChildAddcontroller);
                                } else if (_tlnumberTextField.text.length !=
                                    10) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text('Số điện thoại phải đúng 10 số'),
                                    duration: Duration(seconds: 1),
                                  ));
                                } //
                                else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Đã lưu'),
                                    duration: Duration(seconds: 1),
                                  ));
                                  print(age);
                                  print(selectedYear);
                                  print(date);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  ImageIcon(
                                    AssetImage('assets/save.png'),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Lưu",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
