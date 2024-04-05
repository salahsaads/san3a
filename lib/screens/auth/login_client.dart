import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/Home_client/nav_client.dart';
import 'package:project/screens/auth/choice.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/service/auth_client.dart';
import 'package:project/service/auth_service.dart';

class Login_client extends StatefulWidget {
  const Login_client({super.key});

  @override
  State<Login_client> createState() => _LoginState();
}

class _LoginState extends State<Login_client> {
  bool icon_check = true;
  // ignore: non_constant_identifier_names
  bool icon_check_o = true;
  Icon icon = const Icon(Icons.visibility_off);
  bool _save = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _save,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 60.h),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
                    height: 200.h,
                  ),
                  Text(
                    'مرحبا بك من جديد',
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Login_worker()));
                        },
                        child: Text(
                          'تبديل؟',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      Text(
                        '  حساب عميل ',
                        style: TextStyle(
                            color: main_color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Choice()));
                        },
                        child: Text(
                          'انشء حساب جديد',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      Text(
                        '   ليس لديك حساب؟',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: email,
                    decoration: InputDecoration(
                        fillColor: const Color(0xfff0f0f0),
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: 'xxxxxxxxxxxx@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  )
                  /**/ ///////////////////////////////////////////// */
                  ,
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'كلمه السر',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Your Password';
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: icon_check_o,
                    decoration: InputDecoration(
                        fillColor: const Color(0xfff0f0f0),
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (icon_check_o == false) {
                              icon_check_o = true;
                            } else {
                              icon_check_o = false;
                            }
                            setState(() {});
                          },
                          child: icon_check_o
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          if (email.text != "") {
                            await Auth.auth
                                .sendPasswordResetEmail(email: email.text);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              title:
                                  'تم ارسال لينك اعاده تعين رقم السري علي بريدك',
                              titleTextStyle: TextStyle(
                                  color: sec_color,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ).show();
                          }
                        },
                        child: Text(
                          'نسيت كلمه السر؟',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      SizedBox(
                        width: 90.w,
                      ),
                      Text(
                        'تذكر كلمه السر',
                        style: TextStyle(
                            color: sec_color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey'),
                      ),
                      Checkbox(
                        checkColor: main_color,
                        isError: true,
                        tristate: false,
                        value: icon_check,
                        onChanged: (c) {
                          setState(() {
                            if (icon_check == false) {
                              icon_check = true;
                            } else {
                              icon_check = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var x;
                      if (_formKey.currentState!.validate()) {
                        _save = true;
                        setState(() {});
                        x = await Auth_client.signInWithEmailAndPassword(
                            email.text, password.text);
                        if (x == 'yes') {
                          _save = false;
                          setState(() {});
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Nav_Client()),
                              (route) => false);
                        } else {
                          _save = false;
                          setState(() {});
                          if (x.message ==
                              "The supplied auth credential is incorrect, malformed or has expired.") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title:
                                      const Text("Invalid email or password!"),
                                  content: const Text("Please try again."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          _save = false;
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Ok")),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: 250.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: main_color,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Text(
                        'سجل دخولك الان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
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
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
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
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 35, 33, 33)),
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'assets/logof.jpg',
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 33, 32, 32)),
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'assets/google.png',
                          height: 20.h,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
