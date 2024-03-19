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
  List<Widget> body_home = [Body_Home1(), Body_Home2()];
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
          width: 70.w,
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              size: 40,
              color: main_color,
            ),
          )
        ],
        leading:  Padding(
          padding:  EdgeInsets.only(left: 6),
          child: CircleAvatar(
            radius: 4.r,
          ),
        ),
      ),
      ////----------------------------------------------------------------------
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
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
                      width: 120,
                      height: 40,
                      child: Text(
                        'ورشتك',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey'),
                      ),
                      decoration: BoxDecoration(
                          color: n == 0 ? main_color : sec_color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: n == 0 ? main_color : sec_color,
                              width: 2)),
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
                      width: 120,
                      height: 40,
                      child: Text(
                        'الشخصيه',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey'),
                      ),
                      decoration: BoxDecoration(
                          color: n == 1 ? main_color : sec_color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: n == 1 ? main_color : sec_color,
                              width: 2)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              body_home[n]
            ],
          ),
        ),
      ),
    );
  }
}
