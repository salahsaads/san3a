import 'package:flutter/material.dart';

import 'package:project/screens/introduction_screen.dart';

void main() {
  runApp(const Salah());
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Introduction_screen(),
    );
  }
}
