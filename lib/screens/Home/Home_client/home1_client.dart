// ignore_for_file: dead_code, must_be_immutable, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/like1_model.dart';
import 'package:project/screens/Home/Home_client/all_worker2.dart';
import 'package:project/screens/Home/Home_client/all_workers1.dart';
import 'package:project/screens/Home/Home_client/prof_user_client.dart';
import 'package:project/screens/Home/Home_client/search.dart';
import 'package:project/service/store_client.dart';

class Home1Client extends StatefulWidget {
  const Home1Client({Key? key}) : super(key: key);

  @override
  State<Home1Client> createState() => _Home1ClientState();
}

class _Home1ClientState extends State<Home1Client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to search page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Search(
                                type: 2,
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'بحث',
                          style: TextStyle(
                            color: sec_color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey',
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Icon(
                          Icons.search,
                          size: 30.sp,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              _buildSectionTitle('المفضله'),
              _buildListView3(),
              SizedBox(height: 30.h),
              const Divider(thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => All_workers1()));
                      },
                      child: _buildSectionTitle('المزيد')),
                  _buildSectionTitle('حرفيين متميزين'),
                ],
              ),
              SizedBox(height: 30.h),
              _buildListView1(), // Add ListView.builder here
              SizedBox(height: 10.h),
              const Divider(thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => All_workers2()));
                      },
                      child: _buildSectionTitle('المزيد')),
                  _buildSectionTitle('ورش مميزه'),
                ],
              ),
              SizedBox(height: 30.h),
              _buildListView2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        ': $title',
        style: TextStyle(
          color: main_color,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Marhey',
        ),
      ),
    );
  }

  Widget _buildListView1() {
    return FutureBuilder<List<Info_Model>>(
      future: FireStore_client().Get_Info_all(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        } else if (snapshot.data!.isNotEmpty) {
          List<Info_Model>? infoModels = snapshot.data;

          return SizedBox(
            height: 180.h, // Adjust the height as needed
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: infoModels?.length ?? 0,
              itemBuilder: (context, index) {
                Info_Model info_model = infoModels![index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Worker_prof2(
                                    email: infoModels[index].email!,
                                  )));
                    },
                    onDoubleTap: () {
                      FireStore_client().addUser_like1(
                        fullName: info_model.fullName!,
                        location: info_model.location!,
                        work: info_model.work!,
                        email: info_model.email!,
                        url: info_model.url ?? '',
                        work_name: info_model.workshop_name!,
                        type: '1',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: main_color,
                          content: Text(
                            "❤️ تم الإضافة إلى المفضلات",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
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

                      //awesome(context);
                    },
                    child: Container(
                        width: 100.w,
                        //height: 150.h, // Adjust width as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 1,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 2),
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                info_model.url != null
                                    ? Container(
                                        height: 90.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: main_color,
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(info_model.url!),
                                            fit: BoxFit.cover,
                                          ), // No image if url is null
                                        ),
                                      )
                                    : Container(
                                        height: 90.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: main_color,
                                          //
                                          //
                                          //
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '${info_model.fullName}',
                              style: TextStyle(
                                  color: sec_color,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '${info_model.work}',
                              style: TextStyle(
                                  color: main_color,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '${info_model.location}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  itemSize: 12.sp,
                                  initialRating: info_model.rating ?? 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: main_color,
                                  ),
                                  onRatingUpdate: (ratings) {},
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: Text(
              'لا يوجد حرفي',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
          );
        }
      },
    );
  }

  Widget _buildListView3() {
    return FutureBuilder<List<Like1_model>>(
      future: FireStore_client().Get_like1(), // Call the method to fetch data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        } else if (snapshot.data!.isNotEmpty) {
          List<Like1_model>? infoModels = snapshot.data;

          return SizedBox(
            height: 180.h, // Adjust the height as needed
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: infoModels?.length ?? 0,
              itemBuilder: (context, index) {
                Like1_model like1_model = infoModels![index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Worker_prof2(
                                    email: infoModels[index].email!,
                                  )));
                    },
                    onDoubleTap: () {
                      FireStore_client().deleteUserLike(
                          email: like1_model.email!, type: like1_model.type!);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: main_color,
                          content: Text(
                            "❤️ تم الحذف من المفضلات",
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
                    },
                    child: Container(
                        width: 100.w,
                        //height: 150.h, // Adjust width as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 1,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 2),
                          //   ),
                          // ],
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                like1_model.url != null
                                    ? Container(
                                        height: 90.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: main_color,
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(like1_model.url!),
                                            fit: BoxFit.cover,
                                          ), // No image if url is null
                                        ),
                                      )
                                    : Container(
                                        height: 90.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: main_color,
                                          //
                                          //
                                          //
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child:
                                        Icon(Icons.favorite, color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              like1_model.type == '1'
                                  ? '${like1_model.fullName}'
                                  : '${like1_model.workshop_name}',
                              style: TextStyle(
                                  color: sec_color,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '${like1_model.work}',
                              style: TextStyle(
                                  color: main_color,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '${like1_model.location}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Marhey'),
                            ),



                            
                          ],
                        )),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: Text(
              'لم تقم بالاضافه الي المفضله',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
          );
        }
      },
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////////
  ///ورشه مميزه

  Widget _buildListView2() {
    return FutureBuilder<List<Info_Model>>(
      future:
          FireStore_client().Get_Info_all(), // Call the method to fetch data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        } else if (snapshot.data!.isNotEmpty) {
          List<Info_Model>? infoModels = snapshot.data;

          return SizedBox(
            height: 180.h, // Adjust the height as needed
            child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: infoModels?.length ?? 0,
                itemBuilder: (context, index) {
                  Info_Model infoModel = infoModels![index];
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Worker_prof2(
                                        email: infoModels[index].email!,
                                      )));
                        },
                        onDoubleTap: () {
                          FireStore_client().addUser_like1(
                            fullName: infoModel.fullName!,
                            location: infoModel.location!,
                            work: infoModel.work!,
                            email: infoModel.email!,
                            url: infoModel.url ?? '',
                            work_name: infoModel.workshop_name!,
                            type: '2',
                          );
                          setState(() {
                            // Update the UI after adding the like
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: main_color,
                            content: Text(
                              "❤️ تم الإضافة إلى المفضلات",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Marhey'),
                            ),
                            duration: Duration(
                                seconds: 2), // Optional: Control the duration
                          ));
                        },
                        child: Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors
                                .white, // Example color, replace with your color
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  if (infoModel.url_work != null)
                                    Container(
                                      height: 90.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors
                                            .grey, // Example color, replace with your color
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(infoModel.url_work!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                infoModel.workshop_name ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                infoModel.work ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                infoModel.location ?? '',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
          );
        } else {
          return Center(
            child: Text(
              'لا يوجود ورشه',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
          );
        }
      },
    );
  }
}
