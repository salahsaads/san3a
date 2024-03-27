import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/body_home1.dart';
import 'package:project/screens/Home/body_home2.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> body_home = [const Body_Home1(), const Body_Home2()];
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return
        //----------------------------------------------------------------
        Padding(
      padding:  EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      n = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120.w,
                    height: 40.h,
                    // ignore: sort_child_properties_last
                    child:  Text(
                      'ورشتك',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                    decoration: BoxDecoration(
                        color: n == 0 ? main_color : sec_color,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: n == 0 ? main_color : sec_color, width: 2.w)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      n = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120.w,
                    height: 40.h,
                    // ignore: sort_child_properties_last
                    child: Text(
                      'الشخصيه',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                    decoration: BoxDecoration(
                        color: n == 1 ? main_color : sec_color,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: n == 1 ? main_color : sec_color, width: 2.w)),
                  ),
                )
              ],
            ),
           SizedBox(
              height: 30.h,
            ),
            body_home[n],

            ///-------------
          ],
        ),
      ),
    );
  }
}
