import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:training_flutter/models/reviews.dart';
import 'package:training_flutter/modules/review_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Review_Screen extends StatefulWidget {
  const Review_Screen({Key? key}) : super(key: key);

  @override
  State<Review_Screen> createState() => _Review_ScreenState();
}

class _Review_ScreenState extends State<Review_Screen> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();

  final commentControl = TextEditingController();
  late String comment = commentControl.text;

  int selected = 0;
  double rating = 0;

  void insert(String content) {
    var text = commentControl.text;
    commentControl.value = TextEditingValue(
      text: text + content,
    );
  }

  void clear() {
    var text = commentControl.text;
    commentControl.value = TextEditingValue(
      text: text = '',
    );
  }

  void delete(int index) {
    imgList.removeAt(index);
    print(imgList.length);
  }

  void onBtn() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 208,
            color: Color(0xff737373),
            child: Container(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        'Thêm hình ảnh, video',
                        style: TextStyle(color: Colors.grey),
                      )),
                  ListTile(
                    title: Text(
                      'Camera',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      getCamera();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(color: Color(0xffF4F4F4)),
                  ),
                  ListTile(
                    title: Text(
                      'Chọn ảnh',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      getImage();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 1,
                    child: Container(color: Color(0xffF4F4F4)),
                  ),
                  ListTile(
                    title: Text(
                      'Chọn Video',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      getVideo();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            ),
          );
        });
  }

  late File file;
  final picker = ImagePicker();
  List imgList = [];

  bool isImage = true;

  int sizeByte = 0;
  double sizeMb = 0;
  double fileSize = 0;

  Future getCamera() async {
    final getCmr = await picker.pickImage(source: ImageSource.camera);
    file = File(getCmr!.path);
    imgList.add(file);
    setState(() {
      imgList;
    });
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    file = File(pickedFile!.path);
    imgList.add(file);
    setState(() {
      imgList;
    });
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

    sizeByte = File(getVd.path).lengthSync();
    sizeMb = sizeByte / (1024 * 1024);
    fileSize = fileSize + sizeMb;

    imgList.add(file);
    setState(() {
      imgList;
    });
  }

  Widget customRadiobtn(String text, int index) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            selected = index;
            clear();
            insert(text);
          });
        },
        child: Text(
          text,
          style: TextStyle(
              color: (selected == index) ? Colors.grey : Colors.black,
              fontSize: 10.0),
        ),
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor:
              (selected == index) ? Color(0xffF4F4F4) : Color(0xffFFFFFF),
          side: BorderSide(
              color:
                  (selected == index) ? Color(0xffF4F4F4) : Color(0xffFFFFFF)),
        ));
  }

  Widget customItem(int index) {
    var img = imgList[index];
    return Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.black,
          image: new DecorationImage(
            image: FileImage(img),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Positioned(
            left: 33,
            bottom: 33,
            child: IconButton(
              icon: Icon(
                Icons.highlight_remove,
                color: Color(0xffFFFFFF),
              ),
              onPressed: () {
                print(file);
                setState(() {
                  fileSize = 0;
                  delete(index);
                });
              },
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.image_outlined, color: Colors.white70),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD12805),
        title: Text(
          'Đánh giá sản phẩm',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 20.0,
          ),
        ),
        actions: [
          Container(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 20.0,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF4F4F4),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 2, bottom: 2),
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
                color: Colors.white,
                child: ListTile(
                  leading: Image.network(
                      'https://s3-alpha-sig.figma.com/img/fd35/d369/5ff6a0c489df0124175fbc8653452572?Expires=1665964800&Signature=ZsuCy79OBMKYo9X5guNo5t7pjGjfFgB7bz-M0zyaptNfijY47ITSx6TvEApG4XkyWzxokWPM9HBgfZYTeyU4AdTJuoBLnZfOzC4qfeWakLJvsQWS6ZsAsx~vIBpVIavH5CRI6iazuK9tSI~wG8-ZSZNWsjaDCGMnY~FKY3RWeDj-3aYX0drW93WuYOK9sgUX0LkGi361ldZi~~Yd8n26QiS3D1U8oJKvgKLbwnYiAQdPBo4fW9gWO2Syl-XQNNNFDlyadaXea05D4RiPOS2DK7QIM0OF1pFHfW0~wRA2irmOcIy2s1w27wibsw9aR1KaMCYvE6YDIcObEeeDGocmdQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                  title: Text(
                    'Bột dinh dưỡng Hipp hoa quả, sữa và bắp 250g (Trên 6 tháng)',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 17, bottom: 17),
                color: Colors.white,
                child: Column(
                  children: [
                    Text('Đánh giá của Ba Mẹ về sản phẩm'),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: RatingBar.builder(
                            minRating: 0,
                            itemSize: 30,
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_rate_rounded,
                                  color: Color(0xffF8B61A),
                                ),
                            onRatingUpdate: (rating) => setState(() {
                                  this.rating = rating;
                                  print(rating);
                                }))),
                    Container(
                        padding: EdgeInsets.only(top: 13, left: 10, right: 10),
                        child: Text(
                          'Thêm 10 ký tự và 1 hình ảnh, 1 video để nhận 200 bixu',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )),
                    Container(
                        padding: EdgeInsets.only(left: 17, right: 17, top: 13),
                        child: TextField(
                          controller: commentControl,
                          maxLength: 500,
                          maxLines: 7,
                          style: TextStyle(fontSize: 18.0),
                          decoration: InputDecoration(
                              fillColor: Color(0xffF4F4F4),
                              hoverColor: Color(0xffF4F4F4),
                              focusColor: Color(0xffF4F4F4),
                              filled: true,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        )),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 9), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn(
                                    'Sản phẩm chất lượng tốt', 1),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn('Đóng gói tốt', 2),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn('Dịch vụ tốt', 3),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn(
                                    'Nhân viên giao hàng thân thiện', 4),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn('Giao hàng nhanh', 5),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 7), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: customRadiobtn('Tư vấn nhiệt tình', 6),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Consumer<Review_Controller>(
                        builder: (context, _read, child) {
                      if (imgList.isEmpty) {
                        return SizedBox();
                      }
                      return Container(
                          height: 200,
                          padding: EdgeInsets.all(20),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: imgList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 5.0,
                              crossAxisSpacing: 5.0,
                              childAspectRatio: 4 / 4,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return customItem(index);
                            },
                          ));
                    }),
                    Consumer<Review_Controller>(
                        builder: (context, _read, child) {
                      if (fileSize < 5) {
                        return SizedBox();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      );
                    }),
                    Container(
                      color: Colors.white,
                      // margin: EdgeInsets.only(top: 20),
                      // padding: EdgeInsets.only(right: 20,left: 20),
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          onBtn();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Color(0xff939393),
                              size: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Thêm hình ảnh, video',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Container(
                        color: Color(0xffF4F4F4),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(right: 20, left: 20),
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Color(0xffF12C2C),
                        onPressed: () {
                          _read.addReview(rating, comment, imgList);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Cám ơn vì đã đánh giá sản phẩm của chúng tôi"),
                            duration: Duration(seconds: 1),
                          ));
                          print(_read.review.length);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                getVideo();
                              },
                              child: Text(
                                'Gửi đánh giá',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        ),
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
