import 'package:flutter/material.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({Key? key}) : super(key: key);

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Đang phát triển :))'),
      ),
    );
  }
}
