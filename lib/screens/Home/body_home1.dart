import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body_Home1 extends StatelessWidget {
  const Body_Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Column(
        children: [Text('data')],
      ),
    );
  }
}
