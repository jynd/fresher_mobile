import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';
import 'bottomdialog.dart';

class AddMedia extends StatefulWidget {
  const AddMedia({Key? key}) : super(key: key);

  @override
  State<AddMedia> createState() => _AddMediaState();
}

class _AddMediaState extends State<AddMedia> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Review_Controller>(
        builder: (context, _read, child) {
          if (_read.imgSize == 5 && _read.vdSize == 1) {
            return const SizedBox();
          }
          return Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 50.0,
            child: MaterialButton(
              color: const Color(0xffF4F4F4),
              elevation: 0,
              onPressed: () {
                onBtn();
              },
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                   Icon(
                    Icons.camera_alt_rounded,
                    color: const Color(0xff939393),
                    size: 25,
                  ),
                   SizedBox(
                    width: 20,
                  ),
                   Text(
                    'Thêm hình ảnh, video',
                    style:
                     TextStyle(color: Colors.black, fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onBtn() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const BottomDialog();
        });
  }
}
