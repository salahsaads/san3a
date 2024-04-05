import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/auth/login_worker.dart';

class Third_Intro extends StatelessWidget {
  const Third_Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h,top:16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/intro3.png'),
               Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  'اضافة ورشتك',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 25.sp,
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
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(
                height: 70.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login_worker()));
                },
                child: Container(
                  height: 60.h,
                  width: 200.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: main_color,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    '!هيا بنا',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Marhey'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
