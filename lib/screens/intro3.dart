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
              Image.asset('assets/intro3.png'),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'اضافة ورشتك',
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
                  'يسمح صنعه باضافة ورشتك اذا كنت صاحب صنعه ',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 60,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: main_color, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  '!هيا بنا',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
