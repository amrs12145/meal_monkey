
import 'package:flutter/material.dart';
import 'package:meal_monkey/shared/widgets.dart';



class MenuScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children : [

          Container(
            width: 80.0,
            height: 550.0,
            margin: EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.0),bottomRight: Radius.circular(50.0))
            )
          ),

          Transform.translate(
            offset: Offset(8, 50),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(children: [
          
                KListTile2(
                  onTap: () {
                    
                  },
                  image: CircleAvatar(backgroundImage: AssetImage('assets/images/menu1.png'),radius: 40,foregroundColor: Colors.transparent,),
                  title: 'Food',
                  subTitle: '120 Items',
                ),
          
                KListTile2(
                  onTap: () {
                    
                  },
                  image: CircleAvatar(backgroundImage: AssetImage('assets/images/menu2.png'),radius: 40,foregroundColor: Colors.transparent,),
                  title: 'Beverages',
                  subTitle: '220 Items',
                ),
          
                KListTile2(
                  onTap: () {
                    
                  },
                  image: CircleAvatar(backgroundImage: AssetImage('assets/images/menu3.png'),radius: 40,foregroundColor: Colors.transparent,),
                  title: 'Desserts',
                  subTitle: '155 Items',
                ),
          
                KListTile2(
                  onTap: () {
                    
                  },
                  image: CircleAvatar(backgroundImage: AssetImage('assets/images/menu4.png'),radius: 40,foregroundColor: Colors.transparent,),
                  title: 'Promotions',
                  subTitle: '25 Items',
                ),
          
          
              ]),
            ),
          ),

        ]
      )
    );
    
  }
}