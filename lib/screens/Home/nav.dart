import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/screens/Home/home.dart';
import 'package:project/screens/Home/home2.dart';
import 'package:project/screens/Home/home3.dart';
import 'package:project/screens/Home/worker_prof.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/service/store.dart';
import 'package:project/widget/choose_button.dart';

class Nav extends StatefulWidget {
  Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool isLoading = false;

  static TextStyle optionStyle = TextStyle(
      color: main_color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      fontFamily: 'Marhey');
  int _selectedIndex = 0;

  List<Widget> body = [Home(), const Home2(), const Home3()];
  Image_Model_work image_model_prof = Image_Model_work();
  getdata() async {
    image_model_prof = await FireStore().Get_Image_prof2();

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
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        endDrawer: Drawer(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 150.h),
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
                    await FirebaseAuth.instance.signOut();
                    print('log out');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Login_worker()),
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
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Icon(
                    Icons.menu,
                    size: 40.sp,
                    color: main_color,
                  ),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Worker_prof()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  image: image_model_prof.url != null
                      ? DecorationImage(
                          image: NetworkImage(image_model_prof.url!),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: AssetImage(
                              'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png'),
                          fit: BoxFit.cover,
                        ), // No image if url is null
                ),
                // Placeholder content if url is null
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
                iconSize: 24.sp,
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
      ),
    );
  }
}
