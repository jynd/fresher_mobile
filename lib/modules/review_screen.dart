import 'package:flutter/material.dart';
import 'package:training_flutter/widgets/addmedia.dart';
import 'package:training_flutter/widgets/hinttext.dart';
import 'package:training_flutter/widgets/producttile.dart';
import 'package:training_flutter/widgets/rating.dart';
import 'package:training_flutter/widgets/review.dart';
import 'package:training_flutter/widgets/sendreview.dart';
import 'package:training_flutter/widgets/warning.dart';
import '../widgets/item.dart';
import '../widgets/item2.dart';

class Review_Screen extends StatefulWidget {
  const Review_Screen({Key? key}) : super(key: key);

  @override
  State<Review_Screen> createState() => _Review_ScreenState();
}

class _Review_ScreenState extends State<Review_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffD12805),
        title: const Text(
          'Đánh giá sản phẩm',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 20.0,
          ),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 20.0,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF4F4F4),
          child: Column(
            children: [
              const ProductTile(),
              Container(
                padding: const EdgeInsets.only(top: 17, bottom: 17),
                color: Colors.white,
                child: Column(
                  children: [
                    const Text('Đánh giá của Ba Mẹ về sản phẩm'),
                    const StarRating(),
                    Container(
                        padding: const EdgeInsets.only(top: 13, left: 10, right: 10),
                        child: const Text(
                          'Thêm 10 ký tự và 1 hình ảnh, 1 video để nhận 200 bixu',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )),
                    const ReviewComment(),
                    const RadioCustomHintText(),
                    const ItemList(),
                    const SizedBox(height: 5,),
                    const ItemList2(),
                    const WarningText(),
                    const AddMedia(),
                    SizedBox(
                      height: 70,
                      child: Container(
                        color: const Color(0xffF4F4F4),
                      ),
                    ),
                    const SendReview()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}
