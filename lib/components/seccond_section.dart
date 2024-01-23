import 'package:bmi_app/view_model/BMI_cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/colors.dart';
import '../view_model/BMI_cubit/bmi_cubit.dart';
import 'item_widget.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BMICubit, BMIState>(builder: (context, state) {
     
      BMICubit cubit = BMICubit.get(context);
      return Expanded(
        child: ItemWidget(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Height',
              style:  TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${cubit.height.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Slider(
              value: cubit.height,
              min: 20,
              max: 300,
              divisions: 600,
              onChanged: (value) {
                cubit.changeHeight(value);
              },
              activeColor: AppColor.pink,
            )
          ],
        )),
      );
    },
        buildWhen: (previous, current) {
          //print('build height state');
          return current is ChangeHeightState;
        },
    
    );
  }
}
