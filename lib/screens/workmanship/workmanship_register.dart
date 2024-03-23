import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constant/constant.dart';
import 'package:project/screens/workmanship/Choose_to_make_it.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:intl/intl.dart';

class Workmanship_Register extends StatefulWidget {
  Workmanship_Register({super.key});

  @override
  State<Workmanship_Register> createState() => _Workmanship_RegisterState();
}

class _Workmanship_RegisterState extends State<Workmanship_Register> {
  int select0 = 0;
  DateTime? time;
  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController loaction = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
        child: SingleChildScrollView(
          child: Form(
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
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                TextField(
                  controller: fullname,
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
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                TextField(
                  controller: phoneNumber,
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
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                TextField(
                  controller: email,
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
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration:
                      const InputDecoration(suffixIcon: Icon(Icons.visibility)),
                )
                //------------------------------------------------------------------------------------------------------------------
                ,
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.visibility)),
                ),

                //------------------------------------------------------------------------------------------------------------------

                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                      'تاريخ الميلاد',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextField(
                  controller: age,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                    onTap: () async {
                      time = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025),
                          initialDate: DateTime.now());
                      print(time);
                      DateTime dateTime = DateTime.now();
                      String formattedDate =
                          DateFormat('yyyy-MM-dd HH:mm:ss').format(time!);
                      print(formattedDate);

                      age.text = formattedDate.substring(0, 11);
                      print(age.text);
                    },
                    child: Icon(
                      Icons.calendar_month,
                    ),
                  )),
                ),
                //------------------------------------------------------------------------------------------------------------------

                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                          3), // Adjust the padding as needed
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
                      '   موقع ورشتك أو موقعك ',
                      style: TextStyle(
                          color: sec_color,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Marhey'),
                    ),
                  ],
                ),
                TextField(
                  controller: loaction,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                    Icons.location_on,
                  )),
                )

                //------------------------------------------
                ,

                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Choose_to_make_it(
                                  location: loaction.text,
                                  fullname: fullname.text,
                                  password: password.text,
                                  phoneNumber: phoneNumber.text,
                                  email: email.text,
                                  dateofbirth: age.text,
                                )));
                  },
                  child: Custom_Buttom(
                    text: 'الاستمرار في التسجيل',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
