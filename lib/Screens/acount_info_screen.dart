import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  late ProductModel productModel;
  var currentItemSelected;
  var formatDate = DateFormat("dd/MM/yyyy");
  ProductController get _watch => context.watch<ProductController>();
  ProductController get _read => context.read<ProductController>();
  String itemsexe = "";
  var listItem = ['Nam', 'Nữ'];
  bool isExpanded = false;
  final List<DynamicWidget> listDynamic = [];
  TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailTextField = TextEditingController();
  final TextEditingController _sexeTextField = TextEditingController();
  final TextEditingController _addressTextField = TextEditingController();
  final TextEditingController _tlnumberTextField = TextEditingController();
  final TextEditingController _nameTextField = TextEditingController();
  addDynamic() {
    listDynamic.add(new DynamicWidget());
    setState(() {});
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD12805),
        title: Text('Thông tin tài khoản'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                            "https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg/revision/latest/top-crop/width/360/height/360?cb=20190423175213",
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          )),
                    Positioned(
                        top: 110,
                        left: 200,
                        child: MaterialButton(
                          height: 50,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Chọn hình đại diện'),
                              duration: Duration(seconds: 1),
                            ));
                            pickImage(ImageSource.gallery);
                          },
                          color: Color(0xffF12C2C),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          shape: CircleBorder(),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    buildTextField(
                        "Họ và tên", _watch.list[0].name, true, _nameTextField),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          fillColor: Color(0xffD9D9D9),
                          filled: true,
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 5, left: 5, top: 5),
                          labelText: 'Ngày sinh',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: formatDate.format(_watch.list[0].birthday),
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black),
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
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 30),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Giới tính',
                          hintText: _watch.list[0].sexe,
                          fillColor: Color(0xffD9D9D9),
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
                    buildTextField(
                        "Email", _watch.list[0].email, false, _emailTextField),
                    buildTextField("Địa chỉ", _watch.list[0].address, false,
                        _addressTextField),
                    buildTextField(
                        "Số điện thoại",
                        _watch.list[0].telenumber.toString(),
                        false,
                        _tlnumberTextField),
                  ],
                ),
              ),
              ListTile(
                leading: Text(
                  "Thông tin con thứ 1",
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
                      buildTextField("Họ và tên", "Họ và tên", false,
                          TextEditingController(text: null)),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: TextField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today),
                            fillColor: Color(0xffD9D9D9),
                            filled: true,
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(bottom: 5, left: 5, top: 5),
                            labelText: 'Ngày sinh',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Ngày Sinh',
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
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
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 30),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Giới tính',
                            fillColor: Color(0xffD9D9D9),
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
              new Container(
                width: double.infinity,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Container(
                        child: new ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listDynamic.length,
                      itemBuilder: (_, index) => DynamicWidget(index: index),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    MaterialButton(
                      color: Colors.white,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF12C2C)),
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: addDynamic,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: Color(0xffF12C2C),
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF12C2C)),
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Đã lưu'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
