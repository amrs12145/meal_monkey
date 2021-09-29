import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/main_application/home/screens/home.dart';
import 'package:meal_monkey/modules/main_application/main_application.dart';
import 'package:meal_monkey/modules/main_application/menu/screens/menu.dart';
import 'package:meal_monkey/modules/main_application/more/screens/more.dart';
import 'package:meal_monkey/modules/main_application/offers/screens/offers.dart';
import 'package:meal_monkey/modules/main_application/profile/screens/profile.dart';
import 'package:meal_monkey/modules/recorder/bloc/cubit.dart';

import 'modules/login/bloc/cubit.dart';
import 'modules/sign_up/bloc/cubit.dart';

import 'modules/login/screens/login.dart';
import 'modules/sign_up/screens/sign_up.dart';
import 'modules/reset_password/screens/new_password.dart';
import 'modules/reset_password/screens/otp.dart';
import 'modules/reset_password/screens/reset.dart';
import 'shared/routes.dart';
import 'modules/splash/screens/splash.dart';

import 'shared/constants.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (_) => SignInCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(),
        ),
        BlocProvider<RecordingCubit>(
          create: (_) => RecordingCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Meal Monkey',
        debugShowCheckedModeBanner: false,
        theme: kThemeData(context),

        initialRoute: Routes.splashScreen,

        routes: {
          Routes.splashScreen           : (_) =>  SplashScreen(),
          Routes.loginScreen            : (_) =>  LoginScreen(),
          Routes.signUpScreen           : (_) =>  SignUpScreen(),
          Routes.resetPasswordScreen    : (_) =>  ResetScreen(),
          Routes.otpScreen              : (_) =>  OTPScreen(),
          Routes.newPasswordScreen      : (_) =>  NewPasswordScreen(),
          Routes.mainApplicationScreen  : (_) =>  MainApplicationScreen(),
          Routes.menuScreen             : (_) =>  MenuScreen(),
          Routes.offersScreen           : (_) =>  OffersScreen(),
          Routes.homeScreen             : (_) =>  HomeScreen(),
          Routes.profileScreen          : (_) =>  ProfileScreen(),
          Routes.moreScreen             : (_) =>  MoreScreen(),

        },

      ),
    );
  }
}


