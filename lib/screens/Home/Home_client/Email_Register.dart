import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:project/service/auth_client.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store_client.dart';

class Register_client_Email extends StatefulWidget {
  Register_client_Email({super.key, required this.email_type});
  String email_type;
  @override
  State<Register_client_Email> createState() => _Register_clientState();
}

class _Register_clientState extends State<Register_client_Email> {
  int select0 = 0;
  DateTime? time;
  bool icon_check1 = true;
  bool icon_check2 = true;
  TextEditingController password = TextEditingController();
  TextEditingController password_sure = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController loaction = TextEditingController();
  TextEditingController workshop_name = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 30.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
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
                        'تسجيل الحساب كا عميل',
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
                  height: 50.h,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 2.0.w, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(12.0
                            .r), // Set border radius if you want rounded corners
                      ),
                      child: Icon(
                        Icons.person,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      ' الاسم بالكامل  ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل الاسم';
                    }
                    return null;
                  },
                  controller: fullname,
                  decoration: InputDecoration(hintText: 'ادخل اسمك'),
                )
                //------------------------------------------------------------------------------------------------------------------
                ,
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 2.0, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(
                            12.0), // Set border radius if you want rounded corners
                      ),
                      child: const Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      '  رقم الهاتف   ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل رقم الهاتف';
                    }
                    return null;
                  },
                  controller: phoneNumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: '01xxxxxxxxx'),
                )
                //------------------------------------------------------------------------------------------------------------------
                ,
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 3.h), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 2.0.w, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(12.0
                            .r), // Set border radius if you want rounded corners
                      ),
                      child: Icon(
                        Icons.email_rounded,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '   البريد الالكتروني    ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل الاميل';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(hintText: 'xxxxxxx@gmail.com'),
                )
                //------------------------------------------------------------------------------------------------------------------
                ,
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 3.h), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 2.0.w, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(12.0
                            .r), // Set border radius if you want rounded corners
                      ),
                      child: Icon(
                        Icons.key_rounded,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '   كلمه السر  ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل كلمه السر';
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: icon_check2,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (icon_check2 == false) {
                          icon_check2 = true;
                        } else {
                          icon_check2 = false;
                        }
                        setState(() {});
                      },
                      child: icon_check2
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                )
                //------------------------------------------------------------------------------------------------------------------
                ,
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 3.h), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 2.0.w, // Set the border width
                        ),
                        borderRadius: BorderRadius.circular(12.0
                            .r), // Set border radius if you want rounded corners
                      ),
                      child: Icon(
                        Icons.key_rounded,
                        size: 20.sp,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '   تاكيد كلمه السر  ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'من فضلك ادخل تاكيد كلمه السر';
                    }
                    return null;
                  },
                  controller: password_sure,
                  obscureText: icon_check1,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (icon_check1 == false) {
                          icon_check1 = true;
                        } else {
                          icon_check1 = false;
                        }
                        setState(() {});
                      },
                      child: icon_check1
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),

                //------------------------------------------------------------------------------------------------------------------

                SizedBox(
                  height: 50.h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var x = await Auth_client.signUpWithEmailAndPassword(
                          email.text, password.text);

                      if (x != null) {
                        FireStore_client_worker().addEmail_type(
                          email: email.text,
                          email_type: widget.email_type,
                        );
                        FireStore_client().addUser_client(
                            email_type: widget.email_type,
                            fullName: fullname.text,
                            phonenumber: phoneNumber.text,
                            email: email.text);
                        Navigator.pushNamed(
                            context, 'EmailVerificationScreen_client');
                      }
                    }
                  },
                  child: Custom_Buttom(
                    text: 'التسجيل',
                  ),
                )
                //------------------------------------------------------------------------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
