abstract class BMIState {}

//for initial state
class BMIInitState extends BMIState {}

//for gender state
class ChangeGenderState extends BMIState {}

//for height state
class ChangeHeightState extends BMIState {}

//for weight states
class AddWeightState extends BMIState {}

class MinusWeightState extends BMIState {}

class ReachMaxWeightState extends BMIState {}

class ReachMinWeightState extends BMIState {}

//for age states
class AddAgeState extends BMIState {}

class ReachMaxAgeState extends BMIState {}

class ReachMinAgeState extends BMIState {}

class MinusAgeState extends BMIState {}

//to calculate BMI 

class CalculateState extends BMIState {}
