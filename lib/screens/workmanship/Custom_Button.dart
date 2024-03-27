import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';

// ignore: must_be_immutable
class Custom_Buttom extends StatelessWidget {
  Custom_Buttom({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 2),
          color: main_color,
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Marhey'),
        ),
      ),
    );
  }
}

/*        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Center(
                    child: Text(
                  'ادخل كود النفعيل ',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                )),
                content: Container(
                  height: 400,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'تم ارسال كود التفعيل الي ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                      Text(
                        widget.phoneNumber.text,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Center(
                                    child: Text(
                                      'اعاده تعيين رقم الهاتف',
                                      style: TextStyle(
                                          color: main_color,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Marhey'),
                                    ),
                                  ),
                                  content: Container(
                                      height: 200,
                                      child: Column(
                                        children: [
                                          const TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                hintText: '01xxxxxxxxx'),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            height: 80,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                // border: Border.all(color: Colors.black, width: 2),
                                                color: main_color,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: const Color.fromARGB(
                                                            255, 5, 5, 5)
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Text(
                                                'تاكيد',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: 'Marhey'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              });
                        },
                        child: const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'تغير الرقم ',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      OtpTextField(
                        fieldWidth: 35,
                        disabledBorderColor: Colors.black,

                        focusedBorderColor: main_color,
                        numberOfFields: 6,
                        enabledBorderColor: Colors.black,
                        // borderColor: main_color,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          Code = code;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${60}',
                            style: TextStyle(color: main_color),
                          ),
                          Text('سيتم ارسال الكود خلال')
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, 'Choose_to_make_it');
                        },
                        child: Container(
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black, width: 2),
                              color: main_color,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 5, 5, 5)
                                      .withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              'تاكيد',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Marhey'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }); */