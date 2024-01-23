import 'package:bmi_app/view_model/BMI_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/colors.dart';
import '../view_model/BMI_cubit/bmi_state.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BMICubit, BMIState>(
      builder: (context, state) {
        BMICubit cubit = BMICubit.get(context);
        return SizedBox(
          width: double.infinity,
          height: 65,
          child: ElevatedButton(
              onPressed: () {
                final result = cubit.calculateBMI();
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColor.darkPrimary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '  Your BMI is :  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.pink,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                ' ${result.toStringAsFixed(1)} ',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.pink,
                  shape: const RoundedRectangleBorder()),
              child: const Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
        );
      },
    );
  }
}
