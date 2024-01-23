import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/bmi_screen.dart';
import 'view_model/BMI_cubit/bmi_cubit.dart';
import 'view_model/BMI_cubit/observer.dart';

void main() {
   Bloc.observer = MyBlocObserver();
  // Use cubits...
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BMICubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI App',
        home: BMI(),
      ),
    );
  }
}
