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
              Image.asset('assets/intro2.png'),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'التسجيل كصاحب صنعه او عميل  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'يمكن التسجيل كصاحب صنعه او عميل و الاستفاده من',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                ' خدمات صنعه',
                style: TextStyle(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
