import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets.dart';
import 'routes.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding:EdgeInsets.all(20.0),children: [

        const SizedBox(height:40),
        Text('Login',style:Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.center,),
        const SizedBox(height:15),
        Text('Add your details to login',style:Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center,),
        const SizedBox(height:40.0),

        KTextFormField(hint:'Your Email'),
        KTextFormField(hint:'Your Password'),
        const SizedBox(height:10.0),

        KButton(
          child: Text('Login'),
          onPressed: (){},
        ),

        const SizedBox(height:25.0),
        InkWell(
          child: Text('Forgot your password?',style: Theme.of(context).textTheme.bodyText2?.copyWith(color:Color(0xff919293)),textAlign:TextAlign.center),
          onTap: () => Navigator.pushNamed(context, Routes.resetPasswordScreen),
        ),
        const SizedBox(height:60.0),
        Text('or Login With',style: Theme.of(context).textTheme.bodyText2?.copyWith(color:Color(0xff919293)),textAlign:TextAlign.center,),
        const SizedBox(height:30.0),

        KButton(
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


        const SizedBox(height:40),

        InkWell(
          onTap:() => Navigator.pushNamed(context, Routes.signUpScreen),
          child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Don\'t have an Account?'),Text('Sign Up')])
        )

      ]),
    );
  }
}