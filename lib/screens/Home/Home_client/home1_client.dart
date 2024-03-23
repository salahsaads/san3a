import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constant/constant.dart';

class Home1Client extends StatefulWidget {
  const Home1Client({super.key});
  
  @override
  State<Home1Client> createState() => _Home1ClientState();
}

class _Home1ClientState extends State<Home1Client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                //صفحه search
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'بحث',
                        style: TextStyle(
                            color: sec_color,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Marhey'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.search,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
            //------------------------------------------------------------------

            ,
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ':المفضله',
                style: TextStyle(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Divider(
              thickness: 1,
            ),
            //----------------------------------------------------------------
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ':حرفيين متميزين',
                style: TextStyle(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Divider(
              thickness: 1,
            ),
            //------------------------------------------------------------------------------------
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ':ورش مميزه',
                style: TextStyle(
                    color: main_color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Marhey'),
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
