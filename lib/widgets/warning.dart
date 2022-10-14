import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class WarningText extends StatefulWidget {
  const WarningText({Key? key}) : super(key: key);

  @override
  State<WarningText> createState() => _WarningTextState();
}

class _WarningTextState extends State<WarningText> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Review_Controller>(
        builder: (context, _read, child) {
          if (_read.imgSize > 5 || _read.vdSize > 1) {
            return Container(
              padding: EdgeInsets.only(left: 18, top: 15, bottom: 20),
              child: Row(
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Lỗi: ',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Vượt quá dung lượng cho phép',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        });
  }
}
