
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/main_application/cubit.dart';
import 'package:meal_monkey/shared/routes.dart';


class KButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final Widget child;
  final Color? primary;
  final Color? onPrimary;
  final OutlinedBorder? border;
  const KButton({this.onPressed,required this.child,this.primary,this.onPrimary,this.border});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: MaterialStateProperty.all(primary),
        foregroundColor: MaterialStateProperty.all(onPrimary),
        shape: MaterialStateProperty.all(border)
      )
    );
  }
}

class KTextFormField extends StatelessWidget {

  final String? hint;
  final TextEditingController? controller;
  const KTextFormField({this.hint,this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          filled: true,
          fillColor: Color(0xfff2f2f2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none
          ),
          contentPadding:const EdgeInsets.fromLTRB(30,25,30,25),
        ),
      ),
      margin:const EdgeInsets.only(bottom: 20.0),
    );
  }
}




class KBottomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context,index){
        
        return Container(
        height: 90,
          child: BottomNavigationBar(

            currentIndex: index,
            onTap: (i) {
              BlocProvider.of<BottomNavCubit>(context).move(i);
            },
            

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more),
                label: 'More',
              ),
            ],

          ),
        );
      
      },
    );
  }
}