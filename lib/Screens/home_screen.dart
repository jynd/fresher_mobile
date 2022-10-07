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
      bottomNavigationBar: BottomNavigationBar(
        // selectedIconTheme: IconThemeData(color: Color(0xffDF2026)),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xffF37170),
        selectedItemColor: Color(0xffDF2026),
        items: [
          BottomNavigationBarItem(
              label: 'Mua Hàng', icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: 'BiboCare', icon: Icon(Icons.monitor_heart)),
          BottomNavigationBarItem(
              label: 'Thanh toán', icon: Icon(Icons.credit_card)),
          BottomNavigationBarItem(
              label: 'Tài Khoản', icon: Icon(Icons.account_circle_outlined)),
        ],
      ),
    );
  }
}
