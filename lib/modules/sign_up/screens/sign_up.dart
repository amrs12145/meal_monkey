import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_monkey/modules/welcomeSelector/screens/welcome_selector.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';


import 'package:meal_monkey/shared/widgets.dart';
import 'package:meal_monkey/shared/routes.dart';


class SignUpScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignUpCubit,SignUpStates>(
        builder: (context,state){

          if ( state is SignedUpSuccessfully )
            return WelcomeSelectorScreen();

          else if ( state is Error )
            return InkWell(onTap:()=>context.read<SignUpCubit>().emit(Intial()),child: Center(child:Text('${state.exception.code}///${state.exception.message}')));

          else if ( state is Loading )
            return CircularProgressIndicator();

          else if ( state is Intial )
            return Form(
              child: ListView(padding:const EdgeInsets.all(20.0),children: [
                  const SizedBox(height:40),
                  Text('Sign Up',style:Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.center,),
                  const SizedBox(height:15),
                  Text('Add your details to sign up',style:Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center,),
                  SizedBox(height:30),

                  KTextFormField(hint: 'Name',      controller: BlocProvider.of<SignUpCubit>(context).nameController ),
                  KTextFormField(hint: 'Email',     controller: BlocProvider.of<SignUpCubit>(context).emailController ),
                  KTextFormField(hint: 'Mobile No', controller: BlocProvider.of<SignUpCubit>(context).mobileController ),
                  KTextFormField(hint: 'Address',   controller: BlocProvider.of<SignUpCubit>(context).addressController ),
                  KTextFormField(hint: 'Password',  controller: BlocProvider.of<SignUpCubit>(context).passwordController ),
                  KTextFormField(hint: 'Confirm Password',),

                  KButton(
                    child: Text('Sign Up'),
                    onPressed:() {

                      context.read<SignUpCubit>().signUpWithEmailAndPassword();
                    
                    }
                  ),

                  SizedBox(height:15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        width: 100,
                        height: 65,
                        child: KButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, Routes.loginScreen);
                          },
                          child: FaIcon(FontAwesomeIcons.facebookF),
                          primary: Color(0xff347ec0),
                          onPrimary: Theme.of(context).accentColor,
                        ),
                      ),

                  Container(
                    width: 100,
                    height: 65,
                    child: KButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, Routes.loginScreen);
                      },
                      child: FaIcon(FontAwesomeIcons.google),
                      primary:Colors.white,
                      onPrimary: Color(0xff838383),
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                        side: BorderSide(color:Colors.grey,width:1)
                      ),
                    ),
                  ),

                  Container(
                    width: 100,
                    height: 65,
                    child: KButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, Routes.loginScreen);
                      },
                      child: FaIcon(FontAwesomeIcons.twitter),
                      primary: Colors.lightBlue,
                      onPrimary: Theme.of(context).accentColor,
                    ),
                  ),

                    ],
                  ),

                  const SizedBox(height:15),
                  InkWell(
                    onTap:() => Navigator.pushNamed(context, Routes.loginScreen),
                    child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Already have an Account?'),Text('Sign In')])
                  )


              ]),
            );
            
          return Center(child: Text('UnKnown State Hhhahaha $state'));

        }, 
      ),
    );

  }
}