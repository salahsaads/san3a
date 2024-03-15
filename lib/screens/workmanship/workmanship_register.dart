import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/constant/constant.dart';

class Workmanship_Register extends StatelessWidget {
  const Workmanship_Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: main_color, width: 3),
                          borderRadius: BorderRadius.circular(7)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: main_color,
                        ),
                      ),
                    ),
                    const Text(
                      'تسجيل الحساب كا صاحب صنعه',
                      style: TextStyle(
                          color: main_color,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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
                      Icons.person,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    ' الاسم بالكامل  ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'ادخل اسمك'),
              )
              //------------------------------------------------------------------------------------------------------------------
              ,
              const SizedBox(
                height: 50,
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
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: '01xxxxxxxxx'),
              )
              //------------------------------------------------------------------------------------------------------------------
              ,
              const SizedBox(
                height: 50,
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
                      Icons.email_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '   البريد الالكتروني    ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'xxxxxxx@gmail.com'),
              )
              //------------------------------------------------------------------------------------------------------------------
              ,
              const SizedBox(
                height: 50,
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
                      Icons.key_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '   كلمه السر  ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(suffixIcon: Icon(Icons.visibility)),
              )
              //------------------------------------------------------------------------------------------------------------------
              ,
              const SizedBox(
                height: 50,
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
                      Icons.key_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '   تاكيد كلمه السر  ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(suffixIcon: Icon(Icons.visibility)),
              ),

              //------------------------------------------------------------------------------------------------------------------

              const SizedBox(
                height: 50,
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
                      Icons.calendar_month,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '   العمر ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                  Icons.calendar_month,
                )),
              ),
              //------------------------------------------------------------------------------------------------------------------

              const SizedBox(
                height: 50,
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
                      Icons.location_on,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    '   الموقع ',
                    style: TextStyle(
                        color: sec_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Marhey'),
                  ),
                ],
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                  Icons.location_on,
                )),
              )

              //------------------------------------------
              ,
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Center(
                              child: Text(
                            'ادخل كود النفعيل ',
                            style: TextStyle(
                                color: main_color,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Marhey'),
                          )),
                          content: Container(
                            height: 400,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'تم ارسال كود التفعيل الي ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Marhey'),
                                ),
                                const Text(
                                  '01063012453',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Marhey'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Center(
                                              child: Text(
                                                'اعاده تعيين رقم الهاتف',
                                                style: TextStyle(
                                                    color: main_color,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: 'Marhey'),
                                              ),
                                            ),
                                            content: Container(
                                                height: 200,
                                                child: Column(
                                                  children: [
                                                    const TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          InputDecoration(
                                                              hintText:
                                                                  '01xxxxxxxxx'),
                                                    ),
                                                    const SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      height: 80,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          // border: Border.all(color: Colors.black, width: 2),
                                                          color: main_color,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      5,
                                                                      5,
                                                                      5)
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 5,
                                                              blurRadius: 7,
                                                              offset: const Offset(
                                                                  0,
                                                                  3), // changes position of shadow
                                                            ),
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 20),
                                                        child: Text(
                                                          'تاكيد',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  'Marhey'),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        });
                                  },
                                  child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'تغير الرقم ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                OtpTextField(
                                  fieldWidth: 35,
                                  disabledBorderColor: Colors.black,

                                  focusedBorderColor: main_color,
                                  numberOfFields: 6,
                                  enabledBorderColor: Colors.black,
                                  // borderColor: main_color,
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  //runs when a code is typed in
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '00:10  ',
                                      style: TextStyle(color: main_color),
                                    ),
                                    Text('سيتم ارسال الكود خلال')
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.black, width: 2),
                                      color: main_color,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              const Color.fromARGB(255, 5, 5, 5)
                                                  .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      'تاكيد',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Marhey'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 2),
                      color: main_color,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          'أستمر في التسجيل',
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
      ),
    );
  }
}
