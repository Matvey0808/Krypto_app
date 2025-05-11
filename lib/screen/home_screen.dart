import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(222, 69, 182, 129),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: SvgPicture.asset(
            "assets/images/glos.svg",
            width: 230,
            height: 230,
          ),
        ),
      ),
    );
  }
}
