import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              padding:  EdgeInsets.only(top: 16.h),
              child: Text(
                'اهلا بك في منصة صنعه ',
                style: TextStyle(
                    color: sec_color, fontSize: 32.sp, fontFamily: 'Marhey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
