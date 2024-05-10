import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project/model/Email_type_model.dart';
import 'package:project/screens/Home/Home_client/nav_client.dart';
import 'package:project/screens/Home/home.dart';
import 'package:project/screens/Home/nav.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/screens/auth/verified.dart';
import 'package:project/screens/auth/verified_client.dart';
import 'package:project/screens/introduction_screen.dart';
import 'package:project/screens/no_connection_screen/No_connection.dart';
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
  runApp(const San3a());
}

class San3a extends StatefulWidget {
  const San3a({Key? key}) : super(key: key);

  @override
  State<San3a> createState() => _San3aState();
}

class _San3aState extends State<San3a> {
  Email_Type_model? email_type_model;
  bool ok = false;
  bool? result;

  checker() async {
    result = await InternetConnectionChecker().hasConnection;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    getEmailType();
    checker();
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
            debugShowCheckedModeBanner: false,
            routes: {
              'Workmanship_Register': (context) => Workmanship_Register(),
              'Home': (context) => Home(),
              "Nav": (context) => Nav(),
              'Login_worker': (context) => const Login_worker(),
              'nav_client': (context) => Nav_Client(),
              'EmailVerificationScreen': (context) =>
                  const EmailVerificationScreen(),
              'EmailVerificationScreen_client': (context) =>
                  const EmailVerificationScreen_client()
            },
            home: result != null
                ? result == true
                    ? (ok == true)
                        ? (email_type_model!.email_type == 'عميل')
                            ? Nav_Client()
                            : (email_type_model!.email_type == 'صاحب صنعه')
                                ? Nav()
                                : Center(child: CircularProgressIndicator())
                        : Introduction_screen()
                    : Noconnection()
                : Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  ));
      },
    );
  }
}
