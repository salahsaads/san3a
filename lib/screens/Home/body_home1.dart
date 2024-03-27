import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';

class Body_Home1 extends StatelessWidget {
  const Body_Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.w,
              height: 160.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage("assets/FB_IMG_1659645799137.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.amber),
            ),
            SizedBox(
              height: 20.h,
            ),
           Text(
              'ورشه النور لسباكه',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
           SizedBox(
              height: 20.h,
            ),
             Text(
              '  صلاح سعد',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
           SizedBox(
              height: 10.h,
            ),
             Text(
              'سباك',
              style: TextStyle(
                  color: main_color,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
             SizedBox(
              height: 10.h,
            ),
          Text(
              '   أجا - المنصوره ',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
           SizedBox(
              height: 30.h,
            ),
           Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':الصور',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                )),
            SizedBox(
              height: 150.h,
              width: double.infinity,
              child: ListView.builder(
                  reverse: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                      child: Container(
                        child: Text('$index'),
                        // margin: EdgeInsets.all(4),
                        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 60.h,
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: main_color, borderRadius: BorderRadius.circular(10.r)),
              child:  Text(
                'اضافه صوره',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
