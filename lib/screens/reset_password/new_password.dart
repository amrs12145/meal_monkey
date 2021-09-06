import 'package:flutter/material.dart';
import 'package:meal_monkey/widgets.dart';


class NewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,children: [

          const SizedBox(height: 35.0),
          Text('New Password',style: Theme.of(context).textTheme.bodyText1,textAlign:TextAlign.center,),
          const SizedBox(height: 35.0),
          Text('please enter your new password',style: Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center,),
          const SizedBox(height: 35.0),

          KTextFormField(hint: 'New Password'),
          KTextFormField(hint: 'Confirm Password'),

          const SizedBox(height: 15.0),
          
          KButton(
            child: Text('Next'),
            onPressed: (){
              
            },
          ),

        ]),
      ),
    );
  }
}