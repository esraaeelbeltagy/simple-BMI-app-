import 'package:bmi_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/first_section.dart';
import '../components/item_widget.dart';
import '../components/seccond_section.dart';
import '../components/third_section.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkPrimary,
      appBar: AppBar(
        backgroundColor: AppColor.darkPrimary,
        title: Text(
          'bmi calculator'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: const Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                FirstSection(),
                SizedBox(
                  height: 20,
                ),
                SecondSection(),
                SizedBox(
                  height: 20,
                ),
                ThirdSection(),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
        CustomButton()
      ]),
    );
  }
}
