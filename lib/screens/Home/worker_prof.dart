import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/auth/login.dart';
import 'package:project/widget/choose_button.dart';

class Worker_prof extends StatefulWidget {
  const Worker_prof({super.key});

  @override
  State<Worker_prof> createState() => _Worker_profState();
}

class _Worker_profState extends State<Worker_prof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 150.h),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                        MaterialPageRoute(builder: (context) => const Login()),
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
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

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
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28.sp,
            color: main_color,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage(
                          "assets/WhatsApp Image 2024-03-19 at 8.43.10 PM.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(150.r),
                  color: Colors.amber),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.person,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ' الاسم بالكامل  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),

            //--------------------------------------------------------------------

            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.all(3), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(
                        12.0), // Set border radius if you want rounded corners
                  ),
                  child: const Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  '  رقم الهاتف   ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),

            //------------------------------------------------------------------------------------------------------------------

            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 3.h), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.email_rounded,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '   البريد الالكتروني    ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),

            //------------------------------------------------------------------------------------------------------------------

            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 3.h), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.key_rounded,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '   كلمه السر  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}
