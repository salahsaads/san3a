import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/Home_client/bodu_home_worker.dart';

import 'body_home_workr2.dart';

class Worker_prof2 extends StatefulWidget {
  Worker_prof2({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  _Worker_prof2State createState() => _Worker_prof2State();
}

class _Worker_prof2State extends State<Worker_prof2> {
  late List<Widget> body_home;
  int n = 0;

  @override
  void initState() {
    super.initState();
    // Initialize body_home after widget.email is available
    body_home = [
      Body_Home_Worker(email: widget.email),
      Body_Home_worker2(email: widget.email),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
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
                      child: Text(
                        'ورشه',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey',
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: n == 0 ? main_color : sec_color,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: n == 0 ? main_color : sec_color,
                          width: 2.w,
                        ),
                      ),
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
                      child:   Text(
                        'الشخصيه',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey',
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: n == 1 ? main_color : sec_color,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: n == 1 ? main_color : sec_color,
                          width: 2.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              body_home[n],
            ],
          ),
        ),
      ),
    );
  }
}
