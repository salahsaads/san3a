import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/auth/client_register.dart';
import 'package:project/screens/workmanship/workmanship_register.dart';

class Choice extends StatelessWidget {
  const Choice({super.key});

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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Choice()));
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Client_Register()));
              },
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // border: Border.all(color: Colors.black, width: 2),

                    color: main_color,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'حساب عميل',
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Workmanship_Register()));
              },
              child: Container(
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 2),
                    color: main_color,
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 5, 5, 5).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.carpenter_sharp,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        'حساب صاحب صنعه',
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
          ],
        ),
      ),
    );
  }
}
