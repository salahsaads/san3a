import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/service/store.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Body_Home1 extends StatefulWidget {
  const Body_Home1({super.key});

  @override
  State<Body_Home1> createState() => _Body_Home1State();
}

class _Body_Home1State extends State<Body_Home1> {
  File? file;
  Info_Model? info_model;
  String? url;
  Image_Model_work? image_model_work;
  getImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// Capture a photo.
    final newMetadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      file = File(photo.path);
      var imagename = basename(photo.path);
      var ref = FirebaseStorage.instance.ref('work_image/$imagename');
      await ref.putFile(file!, newMetadata);
      url = await ref.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;

      FireStore().addImage_pro(url: url!, email: user!);
      
      image_model_work = await FireStore().Get_Image_work();
    }

    setState(() {});
  }

  getdata() async {
    info_model = await FireStore().Get_Info();
    image_model_work = await FireStore().Get_Image_work();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                if (image_model_work != null)
                  Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image_model_work!.url!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.amber),
                  )
                else
                  Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image:
                        //         new AssetImage("assets/FB_IMG_1659645799137.jpg"),
                        //     fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.amber),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Container(
                              child: AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        color: main_color,
                                        size: 30.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                    ),
                                    Text(
                                      'هل تود التعديل علي ورشتك؟؟',
                                      style: TextStyle(
                                          color: main_color,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: 'Marhey'),
                                    )
                                  ],
                                ),
                                content: Container(
                                  height: 250.h,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          if (file != null)
                                            Container(
                                              width: 100.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(file!),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: Colors.amber),
                                            )
                                          else
                                            Container(
                                              width: 100.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                  // image: DecorationImage(
                                                  //     image: FileImage(file!),
                                                  //     fit: BoxFit.cover),
                                                  // borderRadius:
                                                  //     BorderRadius.circular(10.r),
                                                  color: Colors.amber),
                                            ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () async {
                                                await getImage();
                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 20.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                ),
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: main_color,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          ':اسم ورشتك',
                                          style: TextStyle(
                                              color: main_color,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Marhey'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'null';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            fillColor: const Color(0xfff0f0f0),
                                            filled: true,
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            hintText: 'اسم ورشتك',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.r))),
                                      )
                                    ],
                                  ),
                                ),
                                actions: [Custom_Buttom(text: 'تعديل')],
                              ),
                            );
                          });

                      //////////////////////////////////////////////////////////////////////////////
                    },
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.settings,
                        color: main_color,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '   ${info_model?.workshop_name}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '   ${info_model?.fullName}',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '${info_model?.work}',
              style: TextStyle(
                  color: main_color,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '   ${info_model?.location}',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':الصور',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                )),
            SizedBox(
              height: 150.h,
              width: double.infinity,
              child: ListView.builder(
                  reverse: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Container(
                        child: Text('$index'),
                        // margin: EdgeInsets.all(4),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 60.h,
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: main_color, borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                'اضافه صوره',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
