import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/Home_client/nav_client.dart';
import 'package:project/screens/auth/login.dart';
import 'package:project/service/auth_service.dart';

class Client_Register extends StatelessWidget {
  const Client_Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 100.h),
        child: Column(
          children: [
            Image.asset(
              'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
              height: 200.h,
            ),
             Text(
              'اهلا بك ',
              style: TextStyle(
                  color: main_color,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Marhey'),
            ),
             SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child:  Text(
                    'سجل دخولك',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Marhey'),
                  ),
                ),
                 Text(
                  '   لديك حساب بالفعل ؟',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),
             SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () async {
                bool s = await Auth.signInWithGoogle();
                if (s == true) {
                  Navigator.pushAndRemoveUntil(
                      context as BuildContext,
                      MaterialPageRoute(builder: (context) => Nav_Client()),
                      (route) => false);
                }
              },
              child: Container(
                height: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    //  border: Border.all(color: Colors.black, width: 2),
                    color: main_color,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child:  Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage('assets/google.png'), width: 50.w),
                      //  Icon(Icons.search_google),
                      Text(
                        'التسجيل عبر حساب جوجل ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 30.h,
            ),
            Container(
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 2),
                  color: main_color,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),

                      spreadRadius: 5.r,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r)),
              child:  Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.facebook,
                      size: 50.sp,
                      color: Colors.white,
                    ),
                    Text(
                      'التسجيل عبر الفيسبوك',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey[400],
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'أو',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  //  border: Border.all(color: Colors.black, width: 2),
                  color: main_color,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                      spreadRadius: 5.r,
                      blurRadius: 7.r,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r)),
              child:  Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.email,
                      size: 40.sp,
                      color: Colors.white,
                    ),
                    //  Icon(Icons.search_google),
                    Text(
                      'التسجيل عبر الاميل',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
