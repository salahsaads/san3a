import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/auth/client_register.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 100.h),
        child: SingleChildScrollView(
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
                      Navigator.of(context).pop();
                    },
                    child: Text(
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Client_Register1(
                            type_email: 'عميل',
                          )));
                },
                child: Container(
                  height: 80.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 5, 5, 5)
                              .withOpacity(0.5),
                          spreadRadius: 5.r,
                          blurRadius: 7.r,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      // border: Border.all(color: Colors.black, width: 2),

                      color: main_color,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person,
                          size: 50.sp,
                          color: Colors.white,
                        ),
                        Text(
                          'حساب عميل',
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Workmanship_Register(
                            email_type: 'صاحب صنعه',
                          )));
                },
                child: Container(
                  height: 80.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 2),
                      color: main_color,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 5, 5, 5)
                              .withOpacity(0.5),
                          spreadRadius: 5.r,
                          blurRadius: 7.r,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.carpenter_sharp,
                          size: 50.sp,
                          color: Colors.white,
                        ),
                        Text(
                          'حساب صاحب صنعه',
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
            ],
          ),
        ),
      ),
    );
  }
}
