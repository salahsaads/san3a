import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/auth/choice.dart';
import 'package:project/screens/auth/login.dart';

class Client_Register extends StatelessWidget {
  const Client_Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
        child: Column(
          children: [
            Image.asset(
              'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
              height: 200,
            ),
            const Text(
              'اهلا بك ',
              style: TextStyle(
                  color: main_color,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Marhey'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    'سجل دخولك',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Marhey'),
                  ),
                ),
                const Text(
                  '   لديك حساب بالفعل ؟',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'nav_client');
              },
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    //  border: Border.all(color: Colors.black, width: 2),
                    color: main_color,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage('assets/google.png'), width: 50),
                      //  Icon(Icons.search_google),
                      Text(
                        'التسجيل عبر حساب جوجل ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 2),
                  color: main_color,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),

                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.facebook,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      'التسجيل عبر الفيسبوك',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey[400],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'أو',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  //  border: Border.all(color: Colors.black, width: 2),
                  color: main_color,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.email,
                      size: 40,
                      color: Colors.white,
                    ),
                    //  Icon(Icons.search_google),
                    Text(
                      'التسجيل عبر الاميل',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
