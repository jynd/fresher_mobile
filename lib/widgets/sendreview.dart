import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class SendReview extends StatefulWidget {
  const SendReview({Key? key}) : super(key: key);

  @override
  State<SendReview> createState() => _SendReviewState();
}

class _SendReviewState extends State<SendReview> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(right: 20, left: 20),
      height: 50.0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        color: const Color(0xffF12C2C),
        onPressed: () {
          if(_read.rating == 0){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Vui lòng chọn *"),
              duration: Duration(seconds: 1),
            ));
          }
          if(_read.commentControl.text.isEmpty){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Vui lòng nhập đánh giá"),
              duration: Duration(seconds: 1),
            ));
          }
          if(_read.imgSize < 5 || _read.vdSize < 1){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Vui lòng thêm đủ 5 ảnh, 1 video"),
              duration: Duration(seconds: 1),
            ));
          }
          if(_read.commentControl.text.isNotEmpty && _read.imgSize == 5  && _read.vdSize == 1){
            // _read.addReview(rating, comment, imgList);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Cám ơn vì đã đánh giá sản phẩm của chúng tôi"),
              duration: Duration(seconds: 1),
            ));
          }
          print(_read.imgSize);
          print(_read.vdSize);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Gửi đánh giá',
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
