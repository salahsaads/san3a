import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/screens/Home/home.dart';

import 'package:project/screens/introduction_screen.dart';
import 'package:project/screens/workmanship/Choose_to_make_it.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';

void main() {
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
              'Workmanship_Register': (context) => const Workmanship_Register(),
              'Choose_to_make_it': (context) => const Choose_to_make_it(),
              'Home': (context) => Home(),
            },
            home: Introduction_screen(),
          );
        });
  }
}
