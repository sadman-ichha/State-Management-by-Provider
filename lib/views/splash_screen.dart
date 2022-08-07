import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class Splash_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => Home_Screen())),
    );
    return Scaffold(
      body: Center(
        child: Container(
            height: 100.0,
            width: 100.0,
            child: Image.asset("assets/flutter_logo.png")),
      ),
    );
  }
}
