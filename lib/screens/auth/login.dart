import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constant/constant.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const Text(
                '..مرحبا بك من جديد',
                style: TextStyle(
                    color: main_color,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'انشء حساب جديد',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Marhey'),
                  ),
                  Text(
                    ' ليس لديك حساب؟',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'رقم الهاتف/البريد الالكتروني',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: const Color(0xfff0f0f0),
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'xxxxxxxxxxxx@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              )
              /**/ ///////////////////////////////////////////// */
              ,
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'كلمه السر',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: const Color(0xfff0f0f0),
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'نسيت كلمه السر؟',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  const Text(
                    'تذكر كلمه السر',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                  Checkbox(
                    checkColor: main_color,
                    isError: true,
                    tristate: true,
                    value: false,
                    onChanged: (c) {},
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: main_color, borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'سجل دخولك الان',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 35, 33, 33)),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      'assets/logof.jpg',
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 33, 32, 32)),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      'assets/google.png',
                      height: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
