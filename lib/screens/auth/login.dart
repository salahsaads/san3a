import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/Home/nav.dart';
import 'package:project/screens/auth/choice.dart';
import 'package:project/service/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool icon_check = true;
  bool icon_check_o = true;
  Icon icon = Icon(Icons.visibility_off);
  bool _save = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _save,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png',
                    height: 200,
                  ),
                  const Text(
                    'مرحبا بك من جديد',
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
                          'انشء حساب جديد',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      const Text(
                        '   ليس لديك حساب؟',
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
                      'البريد الالكتروني',
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: email,
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
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Your Password';
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: icon_check_o,
                    decoration: InputDecoration(
                        fillColor: const Color(0xfff0f0f0),
                        filled: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (icon_check_o == false) {
                              icon_check_o = true;
                            } else {
                              icon_check_o = false;
                            }
                            setState(() {});
                          },
                          child: icon_check_o
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
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
                      GestureDetector(
                        onTap: () async {
                          if (email.text != "") {
                            await Auth.auth
                                .sendPasswordResetEmail(email: email.text);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              title:
                                  'تم ارسال لينك اعاده تعين رقم السري علي بريدك',
                              titleTextStyle: TextStyle(
                                  color: sec_color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ).show();
                          }
                        },
                        child: const Text(
                          'نسيت كلمه السر؟',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      const SizedBox(
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
                        tristate: false,
                        value: icon_check,
                        onChanged: (c) {
                          setState(() {
                            if (icon_check == false) {
                              icon_check = true;
                            } else {
                              icon_check = false;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var x;
                      if (_formKey.currentState!.validate()) {
                        _save = true;
                        setState(() {});
                        x = await Auth.signInWithEmailAndPassword(
                            email.text, password.text);
                        if (x == 'yes') {
                          _save = false;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Nav()));
                        }
                        _save = false;
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: main_color,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        'سجل دخولك الان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Marhey'),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
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
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
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
        ),
      ),
    );
  }
}
