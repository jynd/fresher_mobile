import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class BottomDialog extends StatefulWidget {
  const BottomDialog({Key? key}) : super(key: key);

  @override
  State<BottomDialog> createState() => _BottomDialogState();
}

class _BottomDialogState extends State<BottomDialog> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208,
      color: const Color(0xff737373),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: const Text(
                  'Thêm hình ảnh, video',
                  style: TextStyle(color: Colors.grey),
                )),
            ListTile(
              title: const Text(
                'Camera',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                _read.getCamera();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 1,
              child: Container(color: const Color(0xffF4F4F4)),
            ),
            ListTile(
              title: const Text(
                'Chọn ảnh',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                _read.getImage();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 1,
              child: Container(color: const Color(0xffF4F4F4)),
            ),
            ListTile(
              title: const Text(
                'Chọn Video',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                _read.getVideo();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
