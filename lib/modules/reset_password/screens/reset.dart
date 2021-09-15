import 'package:flutter/material.dart';

import 'package:meal_monkey/shared/widgets.dart';
import 'package:meal_monkey/shared/routes.dart';


class ResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [

          const SizedBox(height: 35.0),
          Text('Reset Password',style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center),
          const SizedBox(height: 35.0),
          Text('please enter your email to receive a link to create a new password via email',style: Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.center),
          const SizedBox(height: 35.0),

          KTextFormField(hint: 'Your Email'),

          const SizedBox(height: 15.0),

          KButton(
            child: Text('Send'),
            onPressed: (){
              Navigator.pushNamed(context, Routes.otpScreen);
            },
          ),

        ]),
      ),
    );
  }
}