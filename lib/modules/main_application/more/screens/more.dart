
import 'package:flutter/material.dart';
import 'package:meal_monkey/shared/widgets.dart';



class MoreScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [

          KListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.payments,color: Colors.black,),
            title: Text('Payment Details'),
          ),

          KListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.shopping_bag,color: Colors.black,),
            title: Text('My Orders'),
          ),
          
          KListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.notifications_active,color: Colors.black,),
            title: Text('Notifications'),
          ),

          KListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.mail,color: Colors.black,),
            title: Text('Inbox'),
          ),
          
          KListTile(
            onTap: () {
              
            },
            leading: Icon(Icons.info,color: Colors.black,),
            title: Text('About Us'),
          ),

          

        ]),
      )
   );
    
  }
}
