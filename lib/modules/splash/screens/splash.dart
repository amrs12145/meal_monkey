import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:meal_monkey/shared/widgets.dart';
import 'package:meal_monkey/shared/routes.dart';


class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [

            Card(
              child: Stack(children: [

                //SvgPicture.asset('assets/svg/orange_background.svg',width:300,height:300,),
                Image.asset('assets/images/orange_background.png',width: double.infinity,fit: BoxFit.cover,), 

                Positioned(
                  bottom: 0,
                  left:145,
                  child: Image.asset('assets/images/monkey_face.png')
                ),
              ]),
              elevation: 20,
              margin:EdgeInsets.zero,
            ),

            SizedBox(height:30),
            Image.asset('assets/images/meal_monkey.png',),
            SizedBox(height:10),
            Text('FOOD DELIVERY',style:Theme.of(context).textTheme.bodyText2?.copyWith(fontSize:20)),
            SizedBox(height:30),

            Text('Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),

            SizedBox(height:50),

            SizedBox(
              width: size.width*.85,
              child: KButton(
                child: Text('Login'),
                onPressed:() => Navigator.pushNamed(context, Routes.loginScreen)
              ),
            ),

            const SizedBox(height:22.0),

            SizedBox(
              width: size.width*.85,
              child: KButton(
                child: Text('Create an Account'),
                onPressed:() => Navigator.pushNamed(context, Routes.signUpScreen),
                primary: Theme.of(context).accentColor,
                onPrimary: Theme.of(context).primaryColor,
                border: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                  side: BorderSide(color:Theme.of(context).primaryColor,width:1)
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

}