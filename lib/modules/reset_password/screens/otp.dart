import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:meal_monkey/shared/widgets.dart';
import 'package:meal_monkey/shared/routes.dart';


class OTPScreen extends StatelessWidget {

  String number = '010*****56';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(crossAxisAlignment:CrossAxisAlignment.stretch,children: [

          const SizedBox(height: 35.0),
          Text('We have sent an OTP to your Mobile',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize:26),textAlign:TextAlign.center),
          const SizedBox(height: 35.0),
          Text('please check your mobile number $number\ncontinue to reset your password',style: Theme.of(context).textTheme.bodyText2,textAlign:TextAlign.center),
          const SizedBox(height: 35.0),

          KTextFormField(hint: 'Enter OTP'),

          const SizedBox(height: 15.0),

          KButton(
            child: Text('Next'),
            onPressed: (){
              Navigator.pushNamed(context,Routes.newPasswordScreen);
            },
          ),

          const SizedBox(height: 35.0,),

          InkWell(
            onTap: ()=> Navigator.pushNamed(context,Routes.resetPasswordScreen),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn\'t Recieve? ',
                    style: Theme.of(context).textTheme.bodyText2
                  ),
                  TextSpan(
                    text: 'Click Here',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Theme.of(context).primaryColor,fontSize:18)
                  )
                ]
              ),
              textAlign: TextAlign.center,
            ),
          ),

        ]),
      ),
    );
  }
}