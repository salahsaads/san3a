import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';

class Second_Intro extends StatelessWidget {
  const Second_Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/intro2.png'),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'التسجيل كصاحب صنعه او عميل  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'يمكن التسجيل كصاحب صنعه او عميل و الاستفاده من',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                ' خدمات صنعه',
                style: TextStyle(
                    color: main_color,
                    fontSize: 18.sp,
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
