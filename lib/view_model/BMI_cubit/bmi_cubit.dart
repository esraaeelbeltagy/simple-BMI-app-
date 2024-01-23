import 'package:bloc/bloc.dart';
import 'package:bmi_app/view_model/BMI_cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(BMIInitState());

  static BMICubit get(BuildContext context) {
    return BlocProvider.of<BMICubit>(context);
  }

  bool isMale = true;
  double height = 120;
  int weight = 79;
  int age = 20;
  double bmi = 0 ;

//for gender
  void changeGender(bool value) {
    isMale = value;
    emit(ChangeGenderState());
  }

//for change height
  void changeHeight(double value) {
    height = value;
    emit(ChangeHeightState());
  }

//for change weight
  void addWeight() {
    if (weight == 200) {
      emit(ReachMaxWeightState());
      return;
    }
    weight++;
    emit(AddWeightState());
  }

  void minusWeight() {
    if (weight == 0) {
      emit(ReachMinWeightState());
      return;
    }
    weight--;
    emit(MinusWeightState());
  }

// for change age
  void addAge() {
    if (age == 100) {
      emit(ReachMaxAgeState());
      return;
    }
    age++;
    emit(AddAgeState());
  }

  void minusAge() {
    if (age == 0) {
      emit(ReachMinAgeState());
      return;
    }
    age--;
    emit(MinusAgeState());
  }
  
  //to calculate state
  double calculateBMI() {
     bmi = weight / ((height / 100) * (height / 100));
    emit(CalculateState());
  return bmi ; 
  }
}
