import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model_client.dart';
import 'package:project/model/service_model.dart';
import 'package:project/screens/Home/QR_Screen.dart';
import 'package:project/screens/Home/chat/chat_screen.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store_client.dart';

class Home2Client extends StatefulWidget {
  const Home2Client({super.key});

  @override
  State<Home2Client> createState() => _Home2ClientState();
}
 
class _Home2ClientState extends State<Home2Client> {
  Info_Model_Client? info_model_client;
  getdata() async {
    info_model_client = await FireStore_client().Get_Info_client();
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
          future: info_model_client != null && info_model_client!.email != null
              ? FireStore_client_worker().Get_Services2(
                  email_type: 'email_user', email: info_model_client!.email!)
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
                itemCount: snapshot.data!.length, // Assuming snapshot has data
                itemBuilder: (context, index) {
                  // Use data from snapshot to populate the grid item
                  final Service_model service_model = snapshot.data![index];
                  if (service_model.to_be_sure_user == '1' &&
                      service_model.to_be_sure_worker == '1') {
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${service_model.fullName_worker}',
                                              style: TextStyle(
                                                color: main_color,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Marhey',
                                              ),
                                            ),
                                            Text(
                                              '${service_model.work}',
                                              style: TextStyle(
                                                color: sec_color,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Marhey',
                                              ),
                                            ),
                                            Text(
                                              '${service_model.location_worker}',
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
                                        service_model.url_worker != null
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    service_model.url_worker!),
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
                                    Container(
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
                                          service_model.to_be_sure_user == 0
                                              ? 'تاكيد الطلب من العميل '
                                              : ' تم تاكيد الطلب من العميل  ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Marhey',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
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
                                          service_model.to_be_sure_worker == '0'
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
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
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
                                              WidgetStateProperty.all<Color>(
                                                  main_color), // Set background color
                                          overlayColor: WidgetStateProperty
                                              .all<Color>(Colors
                                                  .white), // Set overlay color when pressed
                                          foregroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors
                                                      .white), // Set text color
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Chat_Page(
                                                    service_model: service_model,
                                                      type: 1,
                                                      email_user: service_model
                                                          .email_user!,
                                                      email_worker:
                                                          service_model
                                                              .email_worker!)));
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Text(
                                        'من قبل الحرفي لانهاء العمل QR قم بمسح',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Marhey'),
                                      ),
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
                                                      ScanScreen(
                                                        service_model:
                                                            service_model,
                                                      )));
                                        },
                                        child: Icon(Icons.camera_alt))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return null;
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
