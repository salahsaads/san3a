import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_all.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:project/service/store.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Body_Home1 extends StatefulWidget {
  const Body_Home1({super.key});

  @override
  State<Body_Home1> createState() => _Body_Home1State();
}

class _Body_Home1State extends State<Body_Home1> {
  List<Image_Model_work> image_work_all = [];
  File? file;
  Info_Model? info_model;
  String? url;
  XFile? photo;
  Image_Model_work? image_model_work;
  getImage_prof() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// Capture a photo.

    photo = await picker.pickImage(source: ImageSource.camera);
    file = File(photo!.path);
    setState(() {});
  }

  Future<void> add_image_database() async {
    final newMetadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    if (photo != null) {
      var imagename = basename(photo!.path);
      var ref = FirebaseStorage.instance.ref('work_image/$imagename');
      await ref.putFile(file!, newMetadata);
      url = await ref.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;

      FireStore().addImage_pro(url: url!, email: user!);

      image_model_work = await FireStore().Get_Image_work();
    }
    setState(() {});
  }
  //////////////////////////////////////////////////////////////////////////////////////////

  bool getimage = false;
  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref("work/$imgname");
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;

      FireStore().addImage_work(url: url!, email: user!);
    }
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

  TextEditingController workShop = TextEditingController();

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
                    alignment: Alignment.topRight,
                    // child: GestureDetector(
                    //   onTap: () {
                    //     FireStore().deleteImageWork(image_model_work!.id!);
                    //     FirebaseStorage.instance
                    //         .refFromURL(image_model_work!.url!)
                    //         .delete();

                    //     setState(() {});
                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Icon(Icons.cancel),
                    //   ),
                    // ),
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
                                                  image: DecorationImage(
                                                      image: FileImage(file!),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  color: Colors.amber),
                                            ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                getImage_prof();
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
                                        controller: workShop,
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
                                actions: [
                                  GestureDetector(
                                      onTap: () {
                                        add_image_database();
                                        FireStore().Update_Prof(
                                            info_model!.id!, workShop.text);
                                        getdata();
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: Custom_Buttom(text: 'تعديل'))
                                ],
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
              child: FutureBuilder<List<Image_Model_work_all>>(
                future: FireStore()
                    .getImageWorkAll(), // Your asynchronous function that fetches data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // While data is being fetched, show a loading indicator
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // If an error occurs during data fetching, display an error message
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.data!.length == 0) {
                    return Center(
                      child: Text(
                        'لم تقم باضافه صور الي صفحتك',
                        style: TextStyle(
                            color: sec_color,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey'),
                      ),
                    );
                  } else {
                    // If data fetching is successful, build the ListView
                    return ListView.builder(
                      reverse: true,
                      itemCount:
                          snapshot.data!.length, // Assuming snapshot has data
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        // Use data from snapshot to populate the list item
                        final imageData = snapshot.data![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: Container(
                            alignment: Alignment.topLeft,
                            // ignore: sort_child_properties_last
                            child: GestureDetector(
                              onTap: () {
                                FireStore().deleteImage(imageData.id!);
                                FirebaseStorage.instance
                                    .refFromURL(imageData.url!)
                                    .delete();

                                setState(() {});
                              },
                              child: Icon(Icons.cancel),
                            ), // Display relevant data here
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            width: 150.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(imageData.url!),
                                  fit: BoxFit.cover),
                              color: main_color,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () async {
                await UploadImage_camera();
                setState(() {});
              },
              child: Container(
                height: 60.h,
                width: 200.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: main_color,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  'اضافه صوره',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
