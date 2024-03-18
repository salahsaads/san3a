import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/constant/constant.dart';
import 'package:project/widget/choose_button.dart';

class Choose_to_make_it extends StatelessWidget {
  const Choose_to_make_it({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: main_color, width: 3),
                          borderRadius: BorderRadius.circular(7)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: main_color,
                        ),
                      ),
                    ),
                    const Text(
                      'تسجيل الحساب كا صاحب صنعه',
                      style: TextStyle(
                          color: main_color,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Marhey'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ': حدد نوع حرفتك ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Marhey'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'نجار',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'فني بوتجازات',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'فني غسالات',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'سباك',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'كهربائي',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'نقاش',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'فني تكيف',
              ),
              const SizedBox(
                height: 30,
              ),
              MyWidget_button(
                text: 'فني صيانه اطباق الدش',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
