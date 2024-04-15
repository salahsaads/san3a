import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';

import 'package:project/model/service_model.dart';
import 'package:project/screens/Home/chat/chat_screen.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3ClientState();
}

class _Home3ClientState extends State<Home3> {
  Info_Model? info_model;

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: FutureBuilder<List<Service_model>>(
          future: info_model != null && info_model!.email != null
              ? FireStore_client_worker().Get_Services1(
                  type_email: 'email_worker', email: info_model!.email!)
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
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // If data fetching is successful, build the GridView
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Number of columns in the grid
                  ),
                  itemCount:
                      snapshot.data!.length, // Assuming snapshot has data
                  itemBuilder: (context, index) {
                    // Use data from snapshot to populate the grid item
                    final Service_model service_model = snapshot.data![index];
                    // if (service_model.to_be_sure_user == 1 &&
                    //     service_model.to_be_sure_worker == 1) {
                    //   FireStore_client_worker().add_service_sure(
                    //       fullName_user: info_model_client!.fullName!,
                    //       fullName_worker: info_model!.fullName!,
                    //       location_worker: info_model!.location!,
                    //       work: info_model!.work!,
                    //       email_user: info_model_client!.email!,
                    //       email_worker: info_model!.email!,
                    //       to_be_sure_user: '1',
                    //       to_be_sure_worker: '1',
                    //       url_user: info_model_client!.url!,
                    //       url_worker: info_model!.url!);

                    //   FireStore_client_worker().delete_service1(
                    //       service_model.email_user!,
                    //       service_model.email_worker!);
                    //   setState(() {});
                    // }
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Container(
                        height: 70.h,
                        child: Card(
                          // color: Colors.amber,
                          shadowColor: main_color,
                          elevation: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.cancel_presentation_rounded,
                                      size: 30.sp,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${service_model.fullName_user}',
                                              style: TextStyle(
                                                color: main_color,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Marhey',
                                              ),
                                            ),
                                            Text(
                                              '${service_model.location_user}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Marhey',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        service_model.url_user != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    service_model.url_user!),
                                                radius: 50.r,
                                              )
                                            : CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/WhatsApp Image 2024-03-19 at 8.43.10 PM.jpeg'),
                                                radius: 50.r,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        FireStore_client_worker()
                                            .to_be_sure_worker(
                                                email1:
                                                    service_model.email_user!,
                                                email2: service_model
                                                    .email_worker!);

                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 5.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.r),
                                          color:
                                              service_model.to_be_sure_worker ==
                                                      '0'
                                                  ? main_color
                                                  : Colors.red,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Text(
                                            service_model.to_be_sure_worker ==
                                                    '0'
                                                ? 'تاكيد الطلب من الصنيعي'
                                                : 'تم تاكيد الطلب من الصنيعي',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Marhey',
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'تواصل مع الحرفي لتاكيد الميعاد',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Marhey'),
                                    ),
                                    TextButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  main_color), // Set background color
                                          overlayColor: MaterialStateProperty
                                              .all<Color>(Colors
                                                  .white), // Set overlay color when pressed
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors
                                                      .white), // Set text color
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Chat_Page(
                                                        service_model:
                                                            service_model,
                                                        type: 2,
                                                        email_user:
                                                            service_model
                                                                .email_user!,
                                                        email_worker:
                                                            service_model
                                                                .email_worker!,
                                                      )));
                                        },
                                        child: Text(
                                          'مراسله',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Marhey',
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
