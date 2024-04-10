import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/info_model.dart';
import 'package:project/screens/Home/Home_client/search.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/service/store_client.dart';
import 'package:project/widget/choose_button.dart';

class All_workers2 extends StatefulWidget {
  const All_workers2({super.key});

  @override
  State<All_workers2> createState() => _All_workersState();
}

class _All_workersState extends State<All_workers2> {
  List<Info_Model>? infoModels = [];

  getData() async {
    infoModels = await FireStore_client().Get_Info_all();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/WhatsApp Image 2024-03-09 at 4.54.36 PM.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                MyWidget_button(
                  text: 'تواصل معانا',
                  back_color1: Colors.white,
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyWidget_button(
                  text: 'من نحن؟',
                  back_color1: Colors.white,
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    print('log out');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login_worker()),
                        (route) => false);
                  },
                  child: MyWidget_button(
                    text: 'تسجيل الخروج',
                    back_color1: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        /*actions: const [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu,
                size: 40,
                color: main_color,
              ),
            )
          ],*/
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Icon(
                  Icons.menu,
                  size: 40.sp,
                  color: main_color,
                ),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 28.sp,
            color: main_color,
          ),
        ),
      ),
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
              SizedBox(
                height: 10.h,
              ),
              _buildSectionTitle(':ورش '),
              SizedBox(
                height: 10.h,
              ),
              _buildListView1()
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
        } else {
          List<Info_Model>? infoModels = snapshot.data;

          return YourGridViewWidget(
            infoModels: infoModels,
          );
        }
      },
    );
  }
}

class YourGridViewWidget extends StatelessWidget {
  List<Info_Model>? infoModels = [];
  YourGridViewWidget({super.key, required this.infoModels});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio:
              0.8, // Aspect ratio (width/height) of each grid item
        ),
        itemCount: infoModels?.length ?? 0,
        itemBuilder: (context, index) {
          Info_Model infoModel = infoModels![index];
          return GestureDetector(
            onDoubleTap: () {
              // Perform Firestore operation or any other actions
              FireStore_client().addUser_like1(
                fullName: infoModel.fullName!,
                location: infoModel.location!,
                work: infoModel.work!,
                email: infoModel.email!,
                url: infoModel.url ?? '',
                work_name: infoModel.workshop_name!,
                type: '2',
              );

              // Show SnackBar when double tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(
                    "❤️ تم الإضافة إلى المفضلات",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white, // Background color of each grid item
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image or placeholder widget
                  Container(
                    height: 90.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue, // Placeholder color if url is null
                      image: infoModel.url != null
                          ? DecorationImage(
                              image: NetworkImage(infoModel.url!),
                              fit: BoxFit.cover,
                            )
                          : null, // No image if url is null
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${infoModel.workshop_name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${infoModel.work}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${infoModel.location}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Marhey',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_border,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
