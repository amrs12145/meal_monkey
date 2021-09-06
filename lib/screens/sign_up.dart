import 'package:flutter/material.dart';

import '../widgets.dart';
import 'routes.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: ListView(padding:EdgeInsets.all(20.0),children: [
            const SizedBox(height:40),
            Text('Sign Up',style:Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.center,),
            const SizedBox(height:15),
            Text('Add your details to sign up',style:Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center,),
            SizedBox(height:30),

            KTextFormField(hint: 'Name',),
            KTextFormField(hint: 'Email',),
            KTextFormField(hint: 'Mobile No',),
            KTextFormField(hint: 'Address',),
            KTextFormField(hint: 'Password',),
            KTextFormField(hint: 'Confirm Password',),

            KButton(
              child: Text('Sign Up'),
              onPressed:() => Navigator.pushNamed(context, Routes.signUpScreen)
            ),

            const SizedBox(height:15),
            InkWell(
              onTap:() => Navigator.pushNamed(context, Routes.loginScreen),
              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text('Already have an Account?'),Text('Sign In')])
            )


        ]),
      ),
    );

  }
}