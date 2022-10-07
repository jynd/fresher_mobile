import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_flutter/modules/review_controller.dart';
import 'package:training_flutter/modules/review_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Review_Controller()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Review_Screen(),
      ),
    );
  }
}
