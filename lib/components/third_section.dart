import 'package:bmi_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/BMI_cubit/bmi_cubit.dart';
import '../view_model/BMI_cubit/bmi_state.dart';
import 'item_widget.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit, BMIState>(
      listener: (context, state) {
        if (state is ReachMaxAgeState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you reached the max age'),
            ),
          );
        }
        if (state is ReachMinAgeState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you reached the min age'),
            ),
          );
        }
        if (state is ReachMaxWeightState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you reached the max weight'),
            ),
          );
        }
         if (state is ReachMinWeightState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('you reached the min weight'),
            ),
          );
        }
      },
      builder: (context, state) {
        BMICubit cubit = BMICubit.get(context);
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: ItemWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${cubit.weight}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: AppColor.darkGrey,
                            shape: const CircleBorder(),
                            onPressed: () {
                              cubit.minusWeight();
                            },
                            child: const Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: AppColor.darkGrey,
                            shape: const CircleBorder(),
                            onPressed: () {
                              cubit.addWeight();
                            },
                            child: const Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: ItemWidget(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${cubit.age}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: AppColor.darkGrey,
                            shape: const CircleBorder(),
                            onPressed: () {
                              cubit.minusAge();
                            },
                            child: const Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            mini: true,
                            backgroundColor: AppColor.darkGrey,
                            shape: const CircleBorder(),
                            onPressed: () {
                              cubit.addAge();
                            },
                            child: const Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
