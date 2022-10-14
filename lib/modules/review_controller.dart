import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:training_flutter/models/reviews.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Review_Controller with ChangeNotifier{
  final List<Review> review = <Review>[];
  List<Review> get getReview => review;
  List imgList = [];
  List vdList = [];

  final commentControl = TextEditingController();
  late String comment = '';

  final picker = ImagePicker();
  late File file;

  int imgSize = 0;
  int vdSize = 0;
  int selected = 0;
  double rating = 0;
  String text ='';

  void addReview(double starRv,String cmtRv,List<dynamic> img){
    final rvlist = Review(
        star: starRv,
        comment: cmtRv,
        imgList: img
    );
    review.add(rvlist);
    notifyListeners();
  }

  void insertReviewText(String content) {
    comment = commentControl.text;
    commentControl.value = TextEditingValue(
      text: comment = "$comment$content, ",
    );
    notifyListeners();
  }

  void delete(int index) {
    imgList.removeAt(index);
    imgSize--;
    notifyListeners();
  }

  void delete2(int index) {
    vdList.removeAt(index);
    vdSize--;
    notifyListeners();
  }

  Future getCamera() async {
    final getCmr = await picker.pickImage(source: ImageSource.camera);
    file = File(getCmr!.path);
    imgList.add(file);
    imgSize = imgSize + 1;
    notifyListeners();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    file = File(pickedFile!.path);
    imgList.add(file);
    imgSize = imgSize + 1;
    notifyListeners();
  }

  Future getVideo() async {
    final getVd = await picker.pickVideo(source: ImageSource.gallery);
    final thumbnail = await VideoThumbnail.thumbnailFile(
        video: getVd!.path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 400,
        maxWidth: 400,
        quality: 75);
    file = File(thumbnail!);
    vdList.add(file);
    vdSize = vdSize +1;
    notifyListeners();
  }
}