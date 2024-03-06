import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Third_Intro extends StatelessWidget {
  const Third_Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'اضافة ورشتك',
                  style: GoogleFonts.abrilFatface(
                    color: sec_color,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'يسمح صنعه باضافة ورشتك اذا كنت صاحب صنعه ',
                  style: GoogleFonts.abrilFatface(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
