import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_all.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';
import 'package:project/service/store.dart';
import 'package:path/path.dart';

class Body_Home2 extends StatefulWidget {
  const Body_Home2({super.key});

  @override
  State<Body_Home2> createState() => _Body_Home2State();
}

class _Body_Home2State extends State<Body_Home2> {
  List<Image_Model_work> image_work_all2 = [];
  File? file2;
  Info_Model? info_model;
  String? url2;
  Image_Model_work? image_model_work;

  //////////////////////////////////////////////////////////////////////////////////////////

  Image_Model_work image_model_prof = Image_Model_work();
  bool getimage = false;
  UploadImage_camera2() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file2 = File(image.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref("work2/$imgname");
      await ref.putFile(file2!, metadata);

      url2 = await ref.getDownloadURL();
    }
  }

  getdata() async {
    info_model = await FireStore().Get_Info();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160.w,
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: info_model != null && info_model!.url != null
                    ? DecorationImage(
                        image: NetworkImage(info_model!.url!),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(
                            'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png'),
                        fit: BoxFit.cover,
                      ), // No image if url is null
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '${info_model?.fullName}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
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
              '${info_model?.location}',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border),
                Icon(Icons.star_border)
              ],
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
                    .getImageWorkAll2(), // Your asynchronous function that fetches data
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
                                FireStore().deleteImage2(imageData.id!);
                                FirebaseStorage.instance
                                    .refFromURL(imageData.url!)
                                    .delete();

                                setState(() {});
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
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
                await UploadImage_camera2();
                setState(() {});
              },
              child: Container(
                height: 60.h,
                width: 200.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: main_color, borderRadius: BorderRadius.circular(10)),
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
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':التعليقات',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                )),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
