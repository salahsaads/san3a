import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constant/constant.dart';

class Body_Home1 extends StatelessWidget {
  const Body_Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage("assets/FB_IMG_1659645799137.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'ورشه النور لسباكه',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '  صلاح سعد',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'سباك',
              style: TextStyle(
                  color: main_color,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '   أجا - المنصوره ',
              style: TextStyle(
                  color: sec_color,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Marhey'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ':الصور',
                  style: TextStyle(
                      color: main_color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Marhey'),
                )),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                  reverse: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text('$index'),
                        // margin: EdgeInsets.all(4),
                        padding: const EdgeInsets.all(8),
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: main_color, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'اضافه صوره',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Marhey'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
