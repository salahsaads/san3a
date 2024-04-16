import 'package:flutter/material.dart';
import 'package:project/model/message.dart';
import 'package:project/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 32, top: 32, bottom: 32),
        //alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)), 
          color:main_color
        ),
        child: Text(
          message.text,
          style: TextStyle(
                                              color:  Colors.white,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Marhey',
                                            ),
        ),
      ),
    );
  }
}

class ChatBubbleFromFriend extends StatelessWidget {
  ChatBubbleFromFriend({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 32, top: 32, bottom: 32),
        //alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)),
          color: Colors.grey,
        ),
        child: Text(
          message.text,
          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Marhey',
                                            ),
        ),
      ),
    );
  }
}
