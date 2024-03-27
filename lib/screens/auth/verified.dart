import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/nav.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:project/service/auth_service.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Auth.auth.currentUser!.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      // TODO: implement your code after email verification
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Successfully Verified")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Nav()));

      timer?.cancel();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80.h),
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
                      ],
                    ),
                  ),
                 SizedBox(height: 250.h),
                  Center(
                    child: Text(
                      'Check your \n Email',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                   SizedBox(height: 8.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 32.0.w),
                    child: Center(
                      child: Text(
                        style: TextStyle(color: Colors.grey),
                        'We have sent you a Email on  ${Auth.auth.currentUser?.email}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                   SizedBox(height: 50.h),
                  const Center(child: CircularProgressIndicator()),
                  SizedBox(height: 50.h),
                 Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                    child: const Center(
                      child: Text(
                        'Verifying email....',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                   SizedBox(height: 57.h),
                  GestureDetector(
                    onTap: () {
                      try {
                        Auth.auth.currentUser?.sendEmailVerification();
                      } catch (e) {
                        debugPrint('$e');
                      }
                    },
                    child: Custom_Buttom(text: 'Resend'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
