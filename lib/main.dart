import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/screens/Home/Home_client/nav_client.dart';
import 'package:project/screens/Home/home.dart';
import 'package:project/screens/Home/nav.dart';
import 'package:project/screens/auth/login.dart';

import 'package:project/screens/introduction_screen.dart';
import 'package:project/screens/workmanship/Choose_to_make_it.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Salah());
}

class Salah extends StatelessWidget {
  const Salah({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            routes: {
              'Workmanship_Register': (context) => Workmanship_Register(),
              'Home': (context) => Home(),
              "Nav": (context) => Nav(),
              'login': (context) => Login(),
              'nav_client':(context) => Nav_Client()
            },
            home: Introduction_screen(),
          );
        });
  }
}
