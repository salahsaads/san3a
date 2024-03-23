import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget_button extends StatefulWidget {
  MyWidget_button(
      {super.key, required this.text, required this.back_color1});
  String text;
  Color back_color1 ;
  @override
  State<MyWidget_button> createState() => _MyWidget_buttonState();
}

class _MyWidget_buttonState extends State<MyWidget_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black, width: 2),
          color: widget.back_color1,
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          widget.text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              fontFamily: 'Marhey'),
        ),
      ),
    );
  }
}
