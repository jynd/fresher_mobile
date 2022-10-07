import 'package:flutter/material.dart';
import 'package:training_flutter/models/reviews.dart';

class Review_Controller with ChangeNotifier{
  final List<Review> review = <Review>[];
  List<Review> get getReview => review;

  void addReview(double starRv,String cmtRv,List<dynamic> img){
    final rvlist = Review(
        star: starRv,
        comment: cmtRv,
        imgList: img
    );
    review.add(rvlist);
    notifyListeners();
  }
}