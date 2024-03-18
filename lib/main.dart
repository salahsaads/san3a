import 'package:flutter/material.dart';

import 'package:project/screens/introduction_screen.dart';
import 'package:project/screens/workmanship/Choose_to_make_it.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';

void main() {
  runApp(const Salah());
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Workmanship_Register':(context) => Workmanship_Register(),
        'Choose_to_make_it':(context) => Choose_to_make_it()
      },
      home: Introduction_screen(),
    );
  }
}
