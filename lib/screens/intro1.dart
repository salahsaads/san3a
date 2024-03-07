import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/constant/constant.dart';

class First_Intro extends StatelessWidget {
  const First_Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/intro.png'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'اهلا بك في منصة صنعه ',
                style: TextStyle(
                    color: sec_color, fontSize: 32, fontFamily: 'Marhey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
