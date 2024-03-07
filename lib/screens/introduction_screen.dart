import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/intro1.dart';
import 'package:project/screens/intro2.dart';
import 'package:project/screens/intro3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction_screen extends StatelessWidget {
  Introduction_screen({super.key});
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [First_Intro(), Second_Intro(), Third_Intro()],
        ),
        Container(
          alignment: Alignment(.90, 0.90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SlideEffect(activeDotColor: main_color),
              ),
              GestureDetector(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Text(
                  'التالي',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
