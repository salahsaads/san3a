import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/service/store.dart';

class Body_Home2 extends StatefulWidget {
  const Body_Home2({super.key});

  @override
  State<Body_Home2> createState() => _Body_Home2State();
}

class _Body_Home2State extends State<Body_Home2> {
  Info_Model? info_model;

  getdata() async {
    info_model = await FireStore().Get_Info();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

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
                      image: new AssetImage(
                          "assets/WhatsApp Image 2024-03-19 at 8.43.10 PM.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.amber),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '${info_model?.fullName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${info_model?.work}',
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
              '${info_model?.location}',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border)
              ],
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
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Container(
                        child: Text('$index'),
                        // margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
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
                  color: main_color, borderRadius: BorderRadius.circular(10)),
              child: Text(
                'اضافه صوره',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':التعليقات',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                )),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
