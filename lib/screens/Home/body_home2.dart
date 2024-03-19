import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constant/constant.dart';

class Body_Home2 extends StatelessWidget {
  const Body_Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.amber),
            child: Image.asset(
              'assets/WhatsApp Image 2024-03-19 at 8.43.10 PM.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '  صلاح سعد',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
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
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_border),
              Icon(Icons.star_border),
              Icon(Icons.star_border),
              Icon(Icons.star_border),
              Icon(Icons.star_border)
            ],
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
                itemCount: 10,
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
          )
        ],
      ),
    );
  }
}
