import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';

class MyWidget_button extends StatelessWidget {
  MyWidget_button({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'تاكيد',
          titleTextStyle: TextStyle(
              color: main_color,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'Marhey'),
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
          btnCancelText: 'لا',
          btnOkText: 'نعم',
          btnOkColor: main_color,
          btnCancelColor: sec_color,
          buttonsTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Marhey'),
        ).show();
      },
      child: Container(
        height: 55,
        width: 350,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.black, width: 2),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Marhey'),
          ),
        ),
      ),
    );
  }
}
