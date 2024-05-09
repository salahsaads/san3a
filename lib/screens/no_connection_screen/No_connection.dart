import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';

class Noconnection extends StatefulWidget {
  const Noconnection({super.key});

  @override
  State<Noconnection> createState() => _NoconnectionState();
}

class _NoconnectionState extends State<Noconnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/undefined (1).png'),
            Text('تفقد اتصالك بالشبكه  واعد\n          تشغيل التطبيق',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Marhey')),
            // SizedBox(
            //   height: 40,
            // ),
            // Container(
            //   width: 100.w,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.r),
            //     color: Colors.black,
            //   ),
            //   child: TextButton(
            //       onPressed: () {

            //       },
            //       child: Text(
            //         'تحميل',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 20.sp,
            //             fontWeight: FontWeight.w500,
            //             fontFamily: 'Marhey'),
            //       )),
            // )
          ],
        ),
      ),
    );
  }
}
