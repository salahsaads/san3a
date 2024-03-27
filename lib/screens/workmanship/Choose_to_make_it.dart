import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/service/store.dart';
import 'package:project/widget/choose_button.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';

class Choose_to_make_it extends StatefulWidget {
  Choose_to_make_it({
    super.key,
    required this.fullname,
    required this.phoneNumber,
    required this.location,
    required this.dateofbirth,
    required this.email,
    required this.password,
  });
  final String fullname;
  final String phoneNumber;
  final String location;
  final String dateofbirth;
  final String email;
  final String password;
  @override
  State<Choose_to_make_it> createState() => _Choose_to_make_itState();
}

class _Choose_to_make_itState extends State<Choose_to_make_it> {
  int select0 = 0;
  String selectText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w, right: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 80.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: main_color, width: 3.w),
                          borderRadius: BorderRadius.circular(7.r)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: main_color,
                        ),
                      ),
                    ),
                   Text(
                      'تسجيل الحساب كا صاحب صنعه',
                      style: TextStyle(
                          color: main_color,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    )
                  ],
                ),
              ),
             SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 1;
                    selectText = 'نجار';
                  });
                },
                child: MyWidget_button(
                  text: 'نجار',
                  back_color1: select0 == 1 ? main_color : Colors.white,
                ),
              ),
              //-------------------------------------------------------------------------------------
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 2;
                    selectText = 'فني بوتجازات';
                  });
                },
                child: MyWidget_button(
                  text: 'فني بوتجازات',
                  back_color1: select0 == 2 ? main_color : Colors.white,
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 3;
                    selectText = 'فني غسالات';
                  });
                },
                child: MyWidget_button(
                  text: 'فني غسالات',
                  back_color1: select0 == 3 ? main_color : Colors.white,
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 4;
                    selectText = 'سباك';
                  });
                },
                child: MyWidget_button(
                  text: 'سباك',
                  back_color1: select0 == 4 ? main_color : Colors.white,
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 5;
                    selectText = 'كهربائي';
                  });
                },
                child: MyWidget_button(
                  text: 'كهربائي',
                  back_color1: select0 == 5 ? main_color : Colors.white,
                ),
              ),
            SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 6;
                    selectText = 'نقاش';
                  });
                },
                child: MyWidget_button(
                  text: 'نقاش',
                  back_color1: select0 == 6 ? main_color : Colors.white,
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 7;
                    selectText = 'فني تكيف';
                  });
                },
                child: MyWidget_button(
                  text: 'فني تكيف',
                  back_color1: select0 == 7 ? main_color : Colors.white,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 8;
                    selectText = 'فني صيانه اطباق الدش';
                  });
                },
                child: MyWidget_button(
                  text: 'فني صيانه اطباق الدش',
                  back_color1: select0 == 8 ? main_color : Colors.white,
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    select0 = 9;
                    selectText = 'أخري';
                  });
                },
                child: MyWidget_button(
                  text: 'أخري',
                  back_color1: select0 == 9 ? main_color : Colors.white,
                ),
              ),
             SizedBox(
                height: 40.h,
              ),

              GestureDetector(
                onTap: () async {
                  var z = await Auth.signUpWithEmailAndPassword(
                      widget.email, widget.password);
                  Navigator.pushNamed(context, 'EmailVerificationScreen');
                  if (FirebaseAuth.instance.currentUser!.emailVerified) {
                    if (z != null) {
                      FireStore().addUser(
                          fullName: widget.fullname,
                          dateOfBirth: widget.dateofbirth,
                          location: widget.location,
                          phonenumber: widget.phoneNumber,
                          email: widget.email,
                          work: selectText);
                    }
                  }
                },
                child: Custom_Buttom(
                  text: 'تسجيل',
                ),
              ),
             SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
