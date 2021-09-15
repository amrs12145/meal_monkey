import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

import 'package:meal_monkey/shared/widgets.dart';
import 'package:meal_monkey/modules/splash/screens/splash.dart';
import 'package:meal_monkey/modules/home/screens/home.dart';
import 'package:meal_monkey/shared/routes.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInCubit,SignInStates>(
        builder: (context, state)
        {

          if ( state is SignedInSuccessfully )
            return HomeScreen();
          else if ( state is Error )
            return InkWell(onTap:()=>context.read<SignInCubit>().emit(Intial()),child: Center(child:Text('${state.exception.code}///${state.exception.message}')));
          
          else if ( state is Loading )
            return CircularProgressIndicator();
          
          else if ( state is Intial )
            return ListView(padding:EdgeInsets.all(20.0),children: [

              const SizedBox(height:35.0),
              Text('Login',style:Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.center,),
              const SizedBox(height:15),
              Text('Add your details to login',style:Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center,),
              const SizedBox(height:35.0),

              KTextFormField(hint:'Your Email',     controller : BlocProvider.of<SignInCubit>(context).emailController    ),
              KTextFormField(hint:'Your Password',  controller : BlocProvider.of<SignInCubit>(context).passwordController ),
              const SizedBox(height:10.0),

              KButton(
                child: Text('Login'),
                onPressed: (){
                  
                  context.read<SignInCubit>().signInWithEmailAndPassword();

                },
              ),

              const SizedBox(height:25.0),
              InkWell(
                child: Text('Forgot your password?',style: Theme.of(context).textTheme.bodyText2?.copyWith(color:Color(0xff919293)),textAlign:TextAlign.center),
                onTap: () => Navigator.pushNamed(context, Routes.resetPasswordScreen),
              ),
              const SizedBox(height:50.0),
              Text('or Login With',style: Theme.of(context).textTheme.bodyText2?.copyWith(color:Color(0xff919293)),textAlign:TextAlign.center,),
              const SizedBox(height:30.0),

              KButton(
                onPressed: (){
                  context.read<SignInCubit>().signInWithFacebook();
                },
                child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  FaIcon(FontAwesomeIcons.facebookF),
                  const SizedBox(width:15.0),
                  Text('Login with Facebook')
                ],),
                primary: Color(0xff347ec0),
                onPrimary: Theme.of(context).accentColor,
              ),

              const SizedBox(height:25.0),

              KButton(
                onPressed: (){
                  context.read<SignInCubit>().signInWithGoogle();
                },
                child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [

                  FaIcon(FontAwesomeIcons.google),
                  const SizedBox(width:15.0),
                  Text('Login with Google')

                ],),
                primary:Colors.white,
                onPrimary: Color(0xff838383),
                border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                  side: BorderSide(color:Colors.grey,width:1)
                ),
              ),


              const SizedBox(height:25),

              KButton(
                onPressed: (){
                  context.read<SignInCubit>().signInWithTwitter();
                },
                child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  FaIcon(FontAwesomeIcons.twitter),
                  const SizedBox(width:15.0),
                  Text('Login with Twitter')
                ],),
                primary: Colors.lightBlue,
                onPrimary: Theme.of(context).accentColor,
              ),

              const SizedBox(height:18.0),

              InkWell(
                onTap:() => Navigator.pushNamed(context, Routes.signUpScreen),
                child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Don\'t have an Account?'),Text('Sign Up')])
              ),


            ]);
            
          return Center(child: Text('UnKnown State Hhhahaha $state'));
        }

      ),
    );
  }
}