import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/model/Email_type_model.dart';
import 'package:project/screens/Home/Home_client/nav_client.dart';
import 'package:project/screens/Home/home.dart';
import 'package:project/screens/Home/nav.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/screens/auth/verified.dart';
import 'package:project/screens/auth/verified_client.dart';
import 'package:project/screens/introduction_screen.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/service/stor_client_and_worker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Salah());
}

class Salah extends StatefulWidget {
  const Salah({Key? key}) : super(key: key);

  @override
  State<Salah> createState() => _SalahState();
}

class _SalahState extends State<Salah> {
  Email_Type_model? email_type_model;
  bool ok = false;

  @override
  void initState() {
    super.initState();
    getEmailType();
  }

  Future<void> getEmailType() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Retrieve user info based on email for client

        email_type_model = await FireStore_client_worker().Get_Email_type();
        if (email_type_model != null) {
          setState(() {});
          ok = true;
          return;
        }

        setState(() {});
      } catch (e) {
        print('Error fetching user info: $e');
      }
    }
    setState(() {}); // Update state even if no user info is found
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            routes: {
              'Workmanship_Register': (context) => Workmanship_Register(),
              'Home': (context) => Home(),
              "Nav": (context) => Nav(),
              'Login_worker': (context) => Login_worker(),
              'nav_client': (context) => Nav_Client(),
              'EmailVerificationScreen': (context) => EmailVerificationScreen(),
              'EmailVerificationScreen_client': (context) =>
                  EmailVerificationScreen_client()
            },
            home: (ok == true)
                ? (email_type_model!.email_type == 'عميل')
                    ? Nav_Client()
                    : (email_type_model!.email_type == 'صاحب صنعه')
                        ? Nav()
                        : Center(child: CircularProgressIndicator())
                : Introduction_screen());
      },
    );
  }
}
