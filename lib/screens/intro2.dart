import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Second_Intro extends StatelessWidget {
  const Second_Intro({Key? key}) : super(key: key);

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
                  'التسجيل كصاحب صنعه او عميل  ',
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
                  'يمكن التسجيل كصاحب صنعه او عميل و الاستفاده من',
                  style: GoogleFonts.abrilFatface(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                ' خدمات صنعه',
                style: GoogleFonts.abrilFatface(
                  color: main_color,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
