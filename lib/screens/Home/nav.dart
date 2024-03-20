import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/home.dart';
import 'package:project/screens/Home/home2.dart';
import 'package:project/screens/Home/home3.dart';

class Nav extends StatefulWidget {
  Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  static const TextStyle optionStyle = TextStyle(
      color: main_color,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Marhey');
  int _selectedIndex = 0;
  List<Widget> body = [Home(), Home2(), Home3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        leading: Padding(
          padding: EdgeInsets.only(left: 6),
          child: CircleAvatar(
            radius: 4.r,
          ),
        ),
      ),
      ////------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: main_color,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'الرئسيه',
                  textStyle: optionStyle,
                ),
                GButton(
                  icon: Icons.assignment_outlined,
                  text: 'الحجوزات',
                  textStyle: optionStyle,
                ),
                GButton(
                  icon: Icons.assignment,
                  text: 'طلبات معلقه',
                  textStyle: optionStyle,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: body[_selectedIndex],
    );
  }
}
