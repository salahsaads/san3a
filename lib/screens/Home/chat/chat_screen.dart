
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/message.dart';
import 'package:project/model/service_model.dart';
import 'package:project/widget/chat_bubble.dart';

class Chat_Page extends StatefulWidget {
  final String email_user;
  final String email_worker;
  final int type;
  final Service_model service_model;
  const Chat_Page(
      {super.key,
      required this.email_user,
      required this.email_worker,
      required this.type,
      required this.service_model});

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  final _controller1 = ScrollController();
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("CreateTime", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 28.sp,
                    color: Colors.grey,
                  ),
                ),
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.type == 2
                          ? '${widget.service_model.fullName_user}'
                          : '${widget.service_model.fullName_worker}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                backgroundColor: main_color,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller1,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          if ((messageList[index].email_user ==
                                  widget.email_user &&
                              messageList[index].email_worker ==
                                  widget.email_worker)) {
                            if (messageList[index].user_send == user!.uid) {
                              return ChatBubble(
                                message: messageList[index],
                              );
                            } else {
                              return ChatBubbleFromFriend(
                                message: messageList[index],
                              );
                            }
                          } else
                            return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (data) {
                        messages.add({
                          'message': data,
                          'CreateTime': DateTime.now(),
                          'email_worker': widget.email_worker,
                          'email_user': widget.email_user,
                          'user_send': user!.uid
                        });
                        _controller.clear();
                        _controller1.animateTo(
                          0,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      decoration: InputDecoration(
                          hintText: "رساله",
                          hintStyle: TextStyle(
                              color: main_color,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              messages.add({
                                'message': _controller.text,
                                'CreateTime': DateTime.now(),
                                'email_worker': widget.email_worker,
                                'email_user': widget.email_user,
                                'user_send': user!.uid
                              });
                              _controller.clear();
                              _controller1.animateTo(
                                0,
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 500),
                              );
                            },
                            child: Icon(
                              Icons.send_rounded,
                              color: main_color,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ModalProgressHUD(inAsyncCall: true, child: Scaffold());
          }
        });
  }
}
