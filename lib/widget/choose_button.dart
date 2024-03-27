import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MyWidget_button extends StatefulWidget {
  MyWidget_button(
      {super.key, required this.text, required this.back_color1});
  String text;
  Color back_color1 ;
  @override
  State<MyWidget_button> createState() => _MyWidget_buttonState();
}

class _MyWidget_buttonState extends State<MyWidget_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 350.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 2),
          color: widget.back_color1,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.1),
              spreadRadius: 5.r,
              blurRadius: 7.r,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w),
        child: Text(
          widget.text,
          style:  TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              fontFamily: 'Marhey'),
        ),
      ),
    );
  }
}
