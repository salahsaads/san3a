import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/like1_model.dart';
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
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.h,
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
              SizedBox(height: 30.h),
              _buildListView3(),
              const Divider(thickness: 1),
              _buildSectionTitle('حرفيين متميزين'),
              SizedBox(height: 30.h),
              _buildListView1(), // Add ListView.builder here
              SizedBox(height: 10.h),
              const Divider(thickness: 1),
              _buildSectionTitle('ورش مميزه'),
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

  // Widget _buildListView1() {
  //   // Example: Assuming craftsmen data is a list of strings

  //   return SizedBox(
  //     height: 180.h, // Adjust the height as needed
  //     child: ListView.builder(
  //       reverse: true,
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 5.w),
  //           child: _buildCraftsmanCard(),
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget _buildListView1() {
    return FutureBuilder<List<Info_Model>>(
      future:
          FireStore_client().Get_Info_all(), // Call the method to fetch data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching data: ${snapshot.error}'));
        } else {
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
                      onDoubleTap: () {},
                      child: _buildCraftsmanCard1(infoModel)),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildCraftsmanCard1(Info_Model info_model) {
    return GestureDetector(
      onDoubleTap: () {
        FireStore_client().addUser_like1(
            fullName: info_model.fullName!,
            location: info_model.location!,
            work: info_model.work!,
            email: info_model.email!,
            url: info_model.url ?? '',
            work_name: info_model.workshop_name!,
            type: '1');
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
                            borderRadius: BorderRadius.circular(10.r),
                            color: main_color,
                            image: DecorationImage(
                              image: NetworkImage(info_model.url!),
                              fit: BoxFit.cover,
                            ), // No image if url is null
                          ),
                        )
                      : Container(
                          height: 90.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
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
                      child: Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ),
                  )
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 18,
                  )
                ],
              ),
            ],
          )),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
///ورشه مميزه

Widget _buildListView2() {
  return FutureBuilder<List<Info_Model>>(
    future: FireStore_client().Get_Info_all(), // Call the method to fetch data
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error fetching data: ${snapshot.error}'));
      } else {
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
                    onDoubleTap: () {}, child: _buildCraftsmanCard2(infoModel)),
              );
            },
          ),
        );
      }
    },
  );
}

Widget _buildCraftsmanCard2(Info_Model info_model) {
  return GestureDetector(
    onDoubleTap: () {
      FireStore_client().addUser_like1(
          fullName: info_model.fullName!,
          location: info_model.location!,
          work: info_model.work!,
          email: info_model.email!,
          url: info_model.url ?? '',
          work_name: info_model.workshop_name!,
          type: '2');
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
                info_model.url_work != null
                    ? Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: main_color,
                          image: DecorationImage(
                            image: NetworkImage(info_model.url_work!),
                            fit: BoxFit.cover,
                          ), // No image if url is null
                        ),
                      )
                    : Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
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
                    child: Icon(
                      Icons.favorite_border_outlined,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${info_model.workshop_name}',
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
          ],
        )),
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
      } else {
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
                    onDoubleTap: () {},
                    child: _buildCraftsmanCard3(like1_model)),
              );
            },
          ),
        );
      }
    },
  );
}

Widget _buildCraftsmanCard3(Like1_model like1_model) {
  return GestureDetector(
    onDoubleTap: () {},
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
                          borderRadius: BorderRadius.circular(10.r),
                          color: main_color,
                          image: DecorationImage(
                            image: NetworkImage(like1_model.url!),
                            fit: BoxFit.cover,
                          ), // No image if url is null
                        ),
                      )
                    : Container(
                        height: 90.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
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
                    child: Icon(Icons.favorite, color: Colors.red),
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
  );
}
