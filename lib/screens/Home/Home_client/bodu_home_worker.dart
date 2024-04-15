import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_all.dart';

import 'package:project/model/info_model.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store.dart';

class Body_Home_Worker extends StatefulWidget {
  Body_Home_Worker({super.key, required this.email});
  String? email;
  @override
  State<Body_Home_Worker> createState() => _Body_Home1State();
}

class _Body_Home1State extends State<Body_Home_Worker> {
  Info_Model? info_model;

  getdata() async {
    info_model =
        await FireStore_client_worker().Get_Info_worker(email: widget.email!);
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
                if (info_model != null && info_model!.url_work != null)
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
                            image: NetworkImage(info_model!.url_work!),
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
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '   ${info_model?.workshop_name}',
              style: TextStyle(
                  color: const Color.fromARGB(255, 136, 26, 26),
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
                  future: info_model != null && info_model!.email != null
                      ? FireStore().getImageWorkAll(email: info_model!.email!)
                      : Future.value([]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While data is being fetched, show a loading indicator
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // If an error occurs during data fetching, display an error message
                      return Center(
                        child: Text(
                          'لم يقم باضافه صور الي صفحته',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                      );
                    } else if (snapshot.data!.isNotEmpty) {
                      // If data fetching is successful, build the ListView
                      return ListView.builder(
                          reverse: true,
                          itemCount: snapshot
                              .data!.length, // Assuming snapshot has data
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // Use data from snapshot to populate the list item
                            final imageData = snapshot.data![index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: Container(
                                alignment: Alignment.topLeft,
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
                          });
                    } else {
                      return Center(
                        child: Text(
                          'لم يقم باضافه صور الي صفحته',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                      );
                    }
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
