import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/image_model_work.dart';
import 'package:project/model/info_model.dart';
import 'package:project/model/info_model_client.dart';
import 'package:project/screens/auth/login_worker.dart';
import 'package:project/service/auth_client.dart';
import 'package:project/service/auth_service.dart';
import 'package:project/service/store.dart';
import 'package:project/service/store_client.dart';
import 'package:project/widget/choose_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Client_prof extends StatefulWidget {
  const Client_prof({super.key});

  @override
  State<Client_prof> createState() => _Worker_profState();
}

class _Worker_profState extends State<Client_prof> {
  File? file2;
  bool getimage = false;
  String? url2;
  UploadImage_camera3() async {
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
      var ref = FirebaseStorage.instance.ref("Client_prof/$imgname");
      await ref.putFile(file2!, metadata);

      url2 = await ref.getDownloadURL();
    }
  }

  add() async {
    FireStore_client()
        .addImag_client(url: url2!, email: info_model_client.email!);

    setState(() {});
  }

  Image_Model_work image_model_prof = Image_Model_work();

  Info_Model_Client info_model_client = Info_Model_Client();
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
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 150.h),
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
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                if (info_model_client.url != null)
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(info_model_client.url!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(150.r),
                        color: Colors.amber),
                  )
                else
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: NetworkImage(image_model_prof.url!),
                        //     fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(150.r),
                        color: Colors.amber),
                  ),
                GestureDetector(
                  onTap: () async {
                    await UploadImage_camera3();
                    if (getimage) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.info,
                        body: Center(
                          child: Text(
                            'تأكيد تغير صوره الملف الشخصي ',
                            style: TextStyle(
                                color: sec_color,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Marhey'),
                          ),
                        ),
                        btnCancelText: 'لا',
                        btnOkText: 'نعم',
                        btnOkOnPress: () {
                          add();
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h), // Adjust the padding as needed
                    decoration: BoxDecoration(
                      color: main_color,
                      border: Border.all(
                        color: Colors.black, // Set the border color
                        width: 2.0.w, // Set the border width
                      ),
                      borderRadius: BorderRadius.circular(12.0
                          .r), // Set border radius if you want rounded corners
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.person,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ' الاسم بالكامل  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${info_model_client.fullName}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              thickness: 0.9,
              color: Colors.grey[400],
            ),
            //--------------------------------------------------------------------

            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.all(3), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(
                        12.0), // Set border radius if you want rounded corners
                  ),
                  child: const Icon(
                    Icons.phone,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '  رقم الهاتف   ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${info_model_client.phonenumber}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Divider(
              thickness: 0.9,
              color: Colors.grey[400],
            ),
            //--------------------------------------------------------------------

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 3.h), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.email_rounded,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '   البريد الالكتروني    ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${info_model_client.email}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Divider(
              thickness: 0.9,
              color: Colors.grey[400],
            ),
            //--------------------------------------------------------------------

            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 3.h), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Set the border color
                      width: 2.0.w, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(12.0
                        .r), // Set border radius if you want rounded corners
                  ),
                  child: Icon(
                    Icons.key_rounded,
                    size: 20.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '   كلمه السر  ',
                  style: TextStyle(
                      color: sec_color,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                ),
                SizedBox(
                  width: 50.w,
                ),
                GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.info,
                      body: Center(
                        child: Text(
                          'تأكيد تغير الباسورد',
                          style: TextStyle(
                              color: sec_color,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Marhey'),
                        ),
                      ),
                      btnCancelText: 'لا',
                      btnOkText: 'نعم',
                      btnOkOnPress: () async {
                        await Auth_client.auth.sendPasswordResetEmail(
                            email: info_model_client.email!);
                      },
                      btnCancelOnPress: () {},
                    ).show();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 3.h), // Adjust the padding as needed
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Set the border color
                        width: 2.0.w, // Set the border width
                      ),
                      borderRadius: BorderRadius.circular(12.0
                          .r), // Set border radius if you want rounded corners
                    ),
                    child: Icon(
                      Icons.border_color,
                      size: 20.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}
