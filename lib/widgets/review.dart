import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class ReviewComment extends StatefulWidget {
  const ReviewComment({Key? key}) : super(key: key);

  @override
  State<ReviewComment> createState() => _ReviewCommentState();
}

class _ReviewCommentState extends State<ReviewComment> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 17, right: 17, top: 13),
        child: TextField(
          controller: _read.commentControl,
          maxLength: 500,
          maxLines: 7,
          style: const TextStyle(fontSize: 16.0),
          decoration: const InputDecoration(
              fillColor: Color(0xffF4F4F4),
              hoverColor: Color(0xffF4F4F4),
              focusColor: Color(0xffF4F4F4),
              filled: true,
              border: UnderlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              )),
        ));
  }
}
