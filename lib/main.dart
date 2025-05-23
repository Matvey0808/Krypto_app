import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:register_app/screen/home_screen.dart';
import 'package:register_app/screen/register1_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}
