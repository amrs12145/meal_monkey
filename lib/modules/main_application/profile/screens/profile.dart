
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'package:meal_monkey/shared/widgets.dart';



class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocProvider<UserCubit>(
      create: (_) => UserCubit(Loading()),
      child: 
      
      BlocBuilder<UserCubit,UserStates>(
        builder: (context,state) {

          if ( state is Loading )
            return CircularProgressIndicator();
          else if ( state is Done )

            return ListView(padding:const EdgeInsets.all(20.0),children: [
      
              Column(
                children: [
                  InkWell(
                    onTap: kZoomTheImage(context,Image.network('https://static.remove.bg/remove-bg-web/8fb1a6ef22fefc0b0866661b4c9b922515be4ae9/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png')),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://static.remove.bg/remove-bg-web/8fb1a6ef22fefc0b0866661b4c9b922515be4ae9/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                      radius: 50,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Icon(Icons.edit,color: Theme.of(context).primaryColor,size: 19,),
                    const SizedBox(width: 5,),
                    Text('Edit Profile',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).primaryColor,fontSize: 14),)
                  ]),
                  const SizedBox(height: 16.0,),
                  Text('Hi there ${BlocProvider.of<UserCubit>(context).nameController.text}!',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 21),),
                  const SizedBox(height: 8.0,),
                  Text('Sign Out',style: Theme.of(context).textTheme.bodyText2,)
                ],
              ),
      
              const SizedBox(height: 32.0,),
      
              KInteractiveTextForm(label: 'Name',hint: 'Write your name',                   controller: BlocProvider.of<UserCubit>(context).nameController),
              KInteractiveTextForm(label: 'Email',hint: 'Write your email',                 controller: BlocProvider.of<UserCubit>(context).emailController),
              KInteractiveTextForm(label: 'Mobile No',hint: 'Write your mobile number',     controller: BlocProvider.of<UserCubit>(context).mobileController),
              KInteractiveTextForm(label: 'Address',hint: 'Write your addres',              controller: BlocProvider.of<UserCubit>(context).addressController),
              KInteractiveTextForm(label: 'Password',hint: 'Write your password',           controller: BlocProvider.of<UserCubit>(context).passwordController),
              KInteractiveTextForm(label: 'Confirm password',hint: 'Rewrite your password', ),
      
              KButton(
                onPressed: () {
                  BlocProvider.of<UserCubit>(context).editData();
                },
                child: Text('Save'),
                primary: Theme.of(context).primaryColor,
                onPrimary: Theme.of(context).accentColor,
              ),
              
              const SizedBox(height: 16.0,),
      
            ]);
          else if ( state is Error)
            return Text('Errror  '*20);
          return Text('unKnown Errrror '*6);
        }
      ),
    );
    
  }
}