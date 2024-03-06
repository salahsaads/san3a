import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';

class First_Intro extends StatelessWidget {
  const First_Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: const Text(
                'اهلا بك في منصة صنعه ',
                style: TextStyle(color: main_color, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
