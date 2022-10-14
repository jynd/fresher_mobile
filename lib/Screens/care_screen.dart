import 'package:flutter/material.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({Key? key}) : super(key: key);

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Gang phát triển :))'),
    );
  }
}
