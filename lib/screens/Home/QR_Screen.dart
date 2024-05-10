import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constant/constant.dart';
import 'package:project/model/service_model.dart';
import 'package:project/service/stor_client_and_worker.dart';
import 'package:project/service/store.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({super.key, required this.service_model});

  Service_model service_model;
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = '';
  var height, width;
  double rating = 0;
  double sum = 0;

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scanning QR code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: scanQr, child: Text(('Scanner'))),
              SizedBox(
                height: width,
              )
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() async {
          qrstr = value;
          if (value == widget.service_model.email_user) {
            await FireStore_client_worker().delete_service1(
                widget.service_model.email_user!,
                widget.service_model.email_worker!);
          }

          if (value == widget.service_model.email_user) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        Text(
                          'اضف تقيمك ل',
                          style: TextStyle(
                            color: main_color,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey',
                          ),
                        ),
                        Text(
                          '${widget.service_model.fullName_worker}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey',
                          ),
                        )
                      ],
                    ),
                    content: Container(
                      height: 190.h,
                      child: Column(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (ratings) {
                              setState(() {
                                rating = ratings;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          TextFormField(
                            controller: comment,
                            decoration: InputDecoration(
                              labelText: ':تعليقك',
                              labelStyle: TextStyle(
                                color: main_color,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Marhey',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await FireStore().addRating(
                                  full_name_user:
                                      widget.service_model.fullName_user!,
                                  url_user: widget.service_model.url_user ?? '',
                                  rating: rating,
                                  email: widget.service_model.email_worker!,
                                  comment: comment.text);

                              Navigator.pop(context);
                            },
                            child: Text(
                              'تاكيد',
                              style: TextStyle(
                                color: main_color,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Marhey',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
