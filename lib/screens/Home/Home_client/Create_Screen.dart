// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';

class CreateScreen extends StatefulWidget {
  CreateScreen({super.key, required this.email_user});

  String? email_user;

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating QR code'),
      ),
      body: Center(
        child: BarcodeWidget(
          data: widget.email_user!,
          barcode: Barcode.qrCode(),
          color: main_color,
          height: 250.h,
          width: 250.w,
        ),
      ),
    );
  }
}
