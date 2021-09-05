import 'package:flutter/material.dart';
import 'package:meal_monkey/screens/login.dart';
import 'package:meal_monkey/screens/sign_up.dart';
import './constants.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Monkey',
      debugShowCheckedModeBanner: false,
      theme: kThemeData(context),

      initialRoute: 'splash screen',

      routes: {
        'splash screen'   : (_) =>  SplashScreen(),
        'login screen'    : (_) =>  LoginScreen(),
        'sign_up screen'  : (_) =>  SignUpScreen(),
      },

    );
  }
}


