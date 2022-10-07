import 'package:flutter/material.dart';
import 'package:training_flutter/Screens/acount_info_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                        'https://www.w3schools.com/HOWTO/img_avatar.png'),
                  ),
                  title: const Text(
                    'Nguyễn Văn A',
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: const Text('0123456789'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_note),
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
              const SizedBox(
                height: 10,
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
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
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
                                  icon: const Icon(
                                    Icons.note_add_rounded,
                                    color: Colors.red,
                                  )),
                            ),
                            const Text('Chờ xác nhân',
                                style: TextStyle(fontSize: 10))
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
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
                                  icon: const Icon(
                                    Icons.card_giftcard,
                                    color: Colors.red,
                                  )),
                            ),
                            const Text('Chờ giao',
                                style: TextStyle(fontSize: 10))
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
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
                                  icon: const Icon(
                                    Icons.local_shipping,
                                    color: Colors.red,
                                  )),
                            ),
                            Text('Đang giao',
                                style: const TextStyle(fontSize: 10))
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
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
                                  child: Icon(
                                    Icons.monetization_on,
                                    color: Color(0xfff8b61a),
                                  )),
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
                                  child: Icon(
                                    Icons.request_quote,
                                    color: Color(0xff5aa753),
                                  )),
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
                                  child: Icon(
                                    Icons.maps_home_work,
                                    color: Color(0xff2151c9),
                                  )),
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
                          leading: Icon(Icons.contact_mail),
                          title: Text('Liên hệ'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Câu hỏi thường gặp'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.question_mark),
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
                          leading: Icon(Icons.notifications),
                          title: Text('Thông báo'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Địa chỉ nhận hàng'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.location_on),
                          title: Text('Địa chỉ nhận hàng'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Giới thiệu'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.sticky_note_2),
                          title: Text('Giới thiệu'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Đóng góp ý kiến'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.event_note_rounded),
                          title: Text('Đóng góp ý kiến'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Đăng xuất'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.logout_outlined),
                          title: Text('Đăng xuất'),
                        ),
                        ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Xóa tài khoản'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                          leading: Icon(Icons.no_accounts),
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
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText: 'Code',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 70,
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
                            icon: Icon(
                              Icons.question_mark,
                              size: 20,
                              color: Colors.white,
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
                            icon: Icon(
                              Icons.sticky_note_2_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
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
