import 'package:flutter/material.dart';
import 'package:training_flutter/Screens/acount_info_screen.dart';

import '../Controllers/product_controller.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ProductController get _watch => context.watch<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg/revision/latest/top-crop/width/360/height/360?cb=20190423175213'),
                  ),
                  title: Text(
                    _watch.list[0].name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  subtitle: Text('${_watch.list[0].telenumber}'),
                  trailing: IconButton(
                    icon: const ImageIcon(
                      AssetImage('assets/edit.png'),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AcountInfoScreen(),
                          ));
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/1.png'),
                              fit: BoxFit.fill)),
                      child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 40, left: 40),
                          child: Text('HẠNG: VÀNG')),
                    )
                  ],
                ),
              ),
              ListTile(
                  leading: const Text(
                    'Đơn mua',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Xem lịch sử mua hàng'),
                        duration: Duration(seconds: 1),
                      ));
                    },
                    child: const Text(
                      'Xem lịch sử mua hàng >',
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xfff2f2f2),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Chờ xác nhận'),
                                        duration: Duration(seconds: 1),
                                      ));
                                    },
                                    icon: const ImageIcon(
                                      AssetImage('assets/choxacnhan.png'),
                                      color: Color(0xffF12C2C),
                                    )),
                              ),
                              const Text('Chờ xác nhân',
                                  style: TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xfff2f2f2),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Chờ giao'),
                                        duration: Duration(seconds: 1),
                                      ));
                                    },
                                    icon: const ImageIcon(
                                      AssetImage('assets/chogiao.png'),
                                      color: Color(0xffF12C2C),
                                    )),
                              ),
                              const Text('Chờ giao',
                                  style: TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xfff2f2f2),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Đang giao'),
                                        duration: Duration(seconds: 1),
                                      ));
                                    },
                                    icon: const ImageIcon(
                                      AssetImage('assets/danggiao.png'),
                                      color: Color(0xffF12C2C),
                                    )),
                              ),
                              Text('Đang giao',
                                  style: const TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xfff2f2f2),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text('Đánh giá'),
                                        duration: Duration(seconds: 1),
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.star_rate_rounded,
                                      color: Color(0xfff8b61a),
                                    )),
                              ),
                              const Text(
                                'Đánh giá',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: const Text(
                  'Tiện ích',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 0.4,
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Danh sách yêu thích'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Danh sách yêu thích'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Bicoin'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: ImageIcon(
                                  AssetImage('assets/bicoin.png'),
                                  color: Color(0xffF8B61A),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('10000 bicoin'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Đơn hàng thường mua'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: ImageIcon(
                                  AssetImage('assets/donhang.png'),
                                  color: Color(0xff5AA753),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Đơn hàng thường mua'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Danh sách cửa hàng'),
                          duration: Duration(seconds: 1),
                        ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: ImageIcon(
                                  AssetImage('assets/shop.png'),
                                  color: Color(0xff2151C9),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Danh sách cửa hàng'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                child: const Text(
                  'Hỗ trợ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Liên hệ'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/lienhe.png')),
                          title: Text('Liên hệ'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Câu hỏi thường gặp'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage(
                            'assets/question_icon.png',
                          )),
                          title: Text('Câu hỏi thường gặp'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 10),
                child: const Text(
                  'Khác',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Thông báo'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/thongbao.png')),
                          title: Text('Thông báo'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Địa chỉ nhận hàng'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/diachi.png')),
                          title: Text('Địa chỉ nhận hàng'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Giới thiệu'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading:
                              ImageIcon(AssetImage('assets/gioithieu.png')),
                          title: Text('Giới thiệu'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Đóng góp ý kiến'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/donggop.png')),
                          title: Text('Đóng góp ý kiến'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Đăng xuất'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/dangxuat.png')),
                          title: Text('Đăng xuất'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Xóa tài khoản'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: ImageIcon(AssetImage('assets/xoatk.png')),
                          title: Text('Xóa tài khoản'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/2.png'), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 30, left: 15),
                        child: Text(
                          'Nhập mã giới thiệu',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.only(top: 5, left: 5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 70,
                              height: 40,
                              child: RaisedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('thành công'),
                                    duration: Duration(seconds: 1),
                                  ));
                                },
                                color: Color(0xffF12C2C),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text('Gửi'),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Mã giới thiệu của bạn',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          IconButton(
                            color: Colors.white,
                            icon: ImageIcon(
                              AssetImage('assets/question_icon.png'),
                              size: 30,
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Mã giới thiệu của bạn'),
                                duration: Duration(seconds: 1),
                              ));
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('đã sao chép'),
                                  duration: Duration(seconds: 1),
                                ));
                              },
                              icon: ImageIcon(
                                  color: Colors.white,
                                  AssetImage('assets/copyfileIcon.png'))),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '4535667',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
