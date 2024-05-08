import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/comment_model.dart';
import 'package:project/model/image_model_all.dart';

import 'package:project/model/info_model.dart';
import 'package:project/model/info_model_client.dart';
import 'package:project/model/service_model.dart';
import 'package:project/screens/workmanship/Custom_Button.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store.dart';
import 'package:project/service/store_client.dart';

class Body_Home_worker2 extends StatefulWidget {
  Body_Home_worker2({super.key, required this.email});
  String? email;

  @override
  State<Body_Home_worker2> createState() => _Body_Home2State();
}

class _Body_Home2State extends State<Body_Home_worker2> {
  Info_Model? info_model;
  Info_Model_Client? info_model_client;
  Service_model? service_model1;
  double sum = 0;
  getdata() async {
    info_model =
        await FireStore_client_worker().Get_Info_worker(email: widget.email!);
    info_model_client = await FireStore_client().Get_Info_client();

    service_model1 = await FireStore_client_worker().Get_Services_all(
        email1: info_model_client!.email!, email2: info_model!.email!);

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
                        image: AssetImage('assets/images (1).png'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating:
                      info_model?.rating == null ? 0 : info_model!.rating!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: main_color,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                  onTap: () async {
                    if (service_model1 == null) {
                      await FireStore_client_worker().add_service(
                          fullName_user: info_model_client!.fullName!,
                          fullName_worker: info_model!.fullName!,
                          location_worker: info_model!.location!,
                          work: info_model!.work!,
                          email_user: info_model_client!.email!,
                          email_worker: info_model!.email!,
                          to_be_sure_user: '0',
                          to_be_sure_worker: '0',
                          url_user: info_model_client!.url ?? "",
                          url_worker: info_model!.url ?? "");

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: main_color,
                          content: Text(
                            'تم الاضافه الي الطلبات المعلقه',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Marhey'),
                          ),
                          duration: Duration(
                              seconds: 2), // Optional: Control the duration
                        ),
                      );
                      setState(() {
                        // Update any stateful variables here
                      });
                    }
                  },
                  child: Custom_Buttom(text: 'احجز')),
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
                    ? FireStore().getImageWorkAll2(email: info_model!.email!)
                    : Future.value([]),

                // Your asynchronous function that fetches data
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
                },
              ),
            ),
            SizedBox(
              height: 10.h,
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
              height: 1.h,
            ),
            SizedBox(
              height: 150.h,
              width: double.infinity,
              child: FutureBuilder<List<Comment_Model>>(
                future: info_model != null && info_model!.email != null
                    ? FireStore().getComments(info_model!.email!)
                    : Future.value([]),

                // Your asynchronous function that fetches data
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
                        'لا يوجد تعليقات',
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
                        final Data = snapshot.data![index];
                        if (snapshot.hasData) {
                          return Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${Data.Full_name_Udser}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Marhey',
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(Data.Image_user!),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  '${Data.Comment}',
                                  style: TextStyle(
                                    color: main_color,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Marhey',
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                RatingBar.builder(
                                  itemSize: 15.sp,
                                  initialRating: Data.Rating!,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (ratings) {},
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'لا يوجد تعلقات',
                              style: TextStyle(
                                  color: sec_color,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
