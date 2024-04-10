import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/info_model_client.dart';
import 'package:project/screens/Home/Home_client/home1_client.dart';
import 'package:project/screens/Home/Home_client/home2_clinet.dart';
import 'package:project/screens/Home/Home_client/home3_clinet.dart';
import 'package:project/screens/Home/Home_client/prof_client.dart';
import 'package:project/screens/auth/login_client.dart';
import 'package:project/service/auth_service.dart';

import 'package:project/widget/choose_button.dart';

import '../../../service/store_client.dart';

class Nav_Client extends StatefulWidget {
  Nav_Client({super.key});

  @override
  State<Nav_Client> createState() => _NavState();
}

class _NavState extends State<Nav_Client> {
  static TextStyle optionStyle = TextStyle(
      color: main_color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Marhey');
  int _selectedIndex = 0;
  List<Widget> body = [
    const Home1Client(),
    const Home2Client(),
    const Home3Client()
  ];

  Info_Model_Client info_model_client = Info_Model_Client();
  getdata() async {
    info_model_client = await FireStore_client().Get_Info_client();

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
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 100.h),
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              MyWidget_button(
                text: 'تواصل معانا',
                back_color1: Colors.white,
              ),
              SizedBox(
                height: 30.h,
              ),
              MyWidget_button(
                text: 'من نحن؟',
                back_color1: Colors.white,
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () async {
                  await Auth.SignOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login_client()),
                      (route) => false);
                },
                child: MyWidget_button(
                  text: 'تسجيل الخروج',
                  back_color1: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
          width: 60.w,
        ),
        /*actions: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              size: 40,
              color: main_color,
            ),
          )
        ],*/
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                size: 40.sp,
                color: main_color,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Client_prof()));
            },
            child: info_model_client.url != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: NetworkImage(info_model_client.url!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null /* add child content here */,
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        // image: const DecorationImage(
                        //   image: AssetImage(
                        //       'assets/WhatsApp Image 2024-03-19 at 8.43.10 PM.jpeg'),
                        //   fit: BoxFit.cover,
                        // ),
                        color: Colors.grey),
                    child: null /* add child content here */,
                  ),
          ),
        ),
      ),
      ////------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.r,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.h),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: main_color,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              duration: const Duration(milliseconds: 400),
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
