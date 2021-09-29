

import 'package:flutter/material.dart';
import 'package:meal_monkey/shared/routes.dart';
import 'package:meal_monkey/shared/widgets.dart';
import '../model/welcomeSelector.dart';



class WelcomeSelectorScreen extends StatelessWidget {

  final List<WelcomeSelectorModel> _list = [
    WelcomeSelectorModel(image: 'assets/images/welcome_selector1.jpg',title: 'Find Food You love' ,description: 'Discover the best foods from 1,00 restaurants and fast delivery to your doorstep'),
    WelcomeSelectorModel(image: 'assets/images/welcome_selector2.jpg',title: 'Fast Delivery' ,description: 'Fast food delivery to your home,office,whenever you are'),
    WelcomeSelectorModel(image: 'assets/images/welcome_selector3.jpg',title: 'Live Tracking' ,description: 'Fast food delivery to your home,office,whenever you are'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _list.length,
        child: Builder(
          
          builder: (ctx)
          {
            final int curr = DefaultTabController.of(ctx)!.index;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [

                        for( WelcomeSelectorModel _listOfWidget in _list )
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(height:35.0),
                              
                              Image.asset(_listOfWidget.image,height: 320.0,),
                              SizedBox(height:35.0),
                              
                              TabPageSelector(
                                selectedColor: Theme.of(ctx).primaryColor,
                              ),
                              SizedBox(height:45.0),
                              
                              Text(_listOfWidget.title,style:Theme.of(context).textTheme.bodyText1),
                              SizedBox(height:45.0),
                              
                              Text(_listOfWidget.description,style:Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.center,),

                            ]
                          ),
                      ],
                    ),
                  ),
                  //TabPageSelector(
                  //  selectedColor: Theme.of(ctx).primaryColor,
                  //),
                  
                  Container(
                    width: 320,
                    child: KButton(
                      child: Text(curr == _list.length-1 ? 'FINISH' : 'NEXT'),
                      onPressed: () {
                        final int curr = DefaultTabController.of(ctx)!.index;
                        if ( curr == _list.length-1 )
                          Navigator.pushReplacementNamed(ctx, Routes.mainApplicationScreen);
                        else 
                          DefaultTabController.of(ctx)!.animateTo(curr+1);
                      },
                    ),
                  ),
                  SizedBox(height:45.0),

                ],
              ),
            );
          }
        ),
        
      ),
    );
  }

}