import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/main_application/main_application_cubit.dart';
import 'package:meal_monkey/shared/routes.dart';
import 'package:meal_monkey/shared/widgets.dart';



class MainApplicationScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider<BottomNavCubit>(
      create: (context) => BottomNavCubit(0),
      child: BlocBuilder<BottomNavCubit,int>(
        builder: (context,index) {
          return Scaffold(

            appBar: kAppBar(BlocProvider.of<BottomNavCubit>(context).getPageName()),
            //body: Center(child:Text('Main Application')),
            body: BlocBuilder<BottomNavCubit,int>(
              builder: (context,index) {
                return BlocProvider.of<BottomNavCubit>(context).getPage();
              },
            ),
            bottomNavigationBar: KBottomNavigationBar(),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(top:32.0),
              child: Builder(
                builder: (context)=>
                FloatingActionButton(
                  foregroundColor: Colors.white,
                  //elevation: 20,
                  backgroundColor: Colors.grey,
                  //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //elevation: 20.0,
                  child: Icon(Icons.home,size:30),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.homeScreen);
                  },
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
    
  }
}