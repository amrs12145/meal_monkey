

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/main_application/home/screens/home.dart';
import 'package:meal_monkey/shared/routes.dart';

import 'menu/screens/menu.dart';
import 'more/screens/more.dart';
import 'offers/screens/offers.dart';
import 'profile/screens/profile.dart';


class BottomNavCubit extends Cubit<int>
{
  BottomNavCubit(int i) : super(i);


  List<Widget> _pages = [
    MenuScreen(),
    OffersScreen(),
    ProfileScreen(),
    MoreScreen(),
    //HomeScreen(),
  ];
  

  void move(int index)
  {
    emit(index);
  }

  
  Widget getPage()
  {
    return _pages[state];
  }


}