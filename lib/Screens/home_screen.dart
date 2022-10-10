import 'package:flutter/material.dart';
import 'package:training_flutter/Screens/pay_screen.dart';

import 'account_screen.dart';
import 'buy_screen.dart';
import 'care_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final screens = [
    BuyScreen(),
    CareScreen(),
    PayScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 18),
                  margin: EdgeInsets.only(right: 5),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Color(0xffF37170)),
                  child: Column(
                    children: [
                      _selectedIndex == 0
                          ? Image.asset('assets/buychoose.png')
                          : Image.asset('assets/buy.png'),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Mua hàng',
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.grey
                                : Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  margin: EdgeInsets.only(right: 5, left: 5),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Color(0xffF37170)),
                  child: Column(
                    children: [
                      _selectedIndex == 1
                          ? Image.asset('assets/carechoose.png')
                          : Image.asset('assets/care.png'),
                      Text(
                        'Bibocare',
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.grey
                                : Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 18),
                  margin: EdgeInsets.only(right: 5, left: 5),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Color(0xffF37170)),
                  child: Column(
                    children: [
                      _selectedIndex == 2
                          ? Image.asset('assets/paychoose.png')
                          : Image.asset('assets/pay.png'),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Thanh toán',
                        style: TextStyle(
                            color: _selectedIndex == 2
                                ? Colors.grey
                                : Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  margin: EdgeInsets.only(left: 5),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Color(0xffF37170)),
                  child: Column(
                    children: [
                      _selectedIndex == 3
                          ? Image.asset('assets/user.png')
                          : Image.asset('assets/usernochoose.png'),
                      Text(
                        'Tài Khoản',
                        style: TextStyle(
                            color: _selectedIndex == 3
                                ? Colors.grey
                                : Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
