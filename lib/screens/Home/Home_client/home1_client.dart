import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';

class Home1Client extends StatefulWidget {
  const Home1Client({super.key});

  @override
  State<Home1Client> createState() => _Home1ClientState();
}

class _Home1ClientState extends State<Home1Client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  //صفحه search
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'بحث',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          Icons.search,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              //------------------------------------------------------------------

              ,
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':المفضله',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              const Divider(
                thickness: 1,
              ),
              //----------------------------------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':حرفيين متميزين',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              const Divider(
                thickness: 1,
              ),
              //------------------------------------------------------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':ورش مميزه',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
