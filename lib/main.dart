import 'package:flutter/material.dart';
import 'package:meal_monkey/screens/login.dart';
import 'package:meal_monkey/screens/sign_up.dart';
import './constants.dart';
import 'screens/reset_password/new_password.dart';
import 'screens/reset_password/otp.dart';
import 'screens/reset_password/reset.dart';
import 'screens/routes.dart';
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
        Routes.splashScreen         : (_) =>  SplashScreen(),
        Routes.loginScreen          : (_) =>  LoginScreen(),
        Routes.signUpScreen         : (_) =>  SignUpScreen(),
        Routes.resetPasswordScreen  : (_) =>  ResetScreen(),
        Routes.otpScreen            : (_) =>  OTPScreen(),
        Routes.newPasswordScreen    : (_) =>  NewPasswordScreen(),
      },

    );
  }
}


