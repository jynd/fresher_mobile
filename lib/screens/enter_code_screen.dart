import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:training_flutter/theme/font.dart';

import '../theme/color.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({super.key});

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  late FocusNode focusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorEnterCode,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: colorAppBar,
          title: const Text(
            'Nhập mã cửa hàng ',
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(20),
            width: 352,
            height: 160,
            child: Column(
              children: [
                const SizedBox(height: 18),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Nhập mã',
                        textAlign: TextAlign.center,
                        style: MyTextStyle().textTitle,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop;
                          print('object');
                        },
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                    margin: const EdgeInsets.only(left: 17, right: 17),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        focusNode: focusNode,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                print('Arrow_forward');
                                _validateForm();
                              },
                              child: const Icon(Icons.arrow_forward),
                            ),
                            labelStyle: MyTextStyle().textSub,
                            labelText: 'Mã cửa hàng',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mã cửa hàng không được để trống ';
                          }
                          return null;
                        },
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  void _showKeyboard() {
    focusNode.requestFocus();
  }

  void _dismissKeyboard() {
    focusNode.unfocus();
  }

  void _validateForm() {
    if (_formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(const SnackBar(content: Text('Processing Data')));
    }
  }
}
