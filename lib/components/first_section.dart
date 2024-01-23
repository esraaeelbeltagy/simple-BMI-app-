import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/BMI_cubit/bmi_cubit.dart';
import '../view_model/BMI_cubit/bmi_state.dart';
import 'item_widget.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BMICubit, BMIState>(
        builder: (context, state) {
         
          BMICubit cubit = BMICubit.get(context);
          return Row(
            children: [
              Expanded(
                child: ItemWidget(
                  isSelected: cubit.isMale,
                  onTap: () {
                    cubit.changeGender(true);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: ItemWidget(
                    isSelected: !cubit.isMale,
                    onTap: () {
                      cubit.changeGender(false);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )),
              )
            ],
          );
        },
        buildWhen: (previous, current) {
         //print('build gender state');
          return current is ChangeGenderState;
        },
      ),
    );
  }
}
