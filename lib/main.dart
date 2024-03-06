import 'package:flutter/material.dart';
import 'package:project/screens/intro1.dart';
import 'package:project/screens/intro2.dart';
import 'package:project/screens/intro3.dart';

void main() {
  runApp(const Salah());
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Third_Intro(),
    );
  }
}
