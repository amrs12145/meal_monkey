
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/main_application/main_application_cubit.dart';
import 'package:meal_monkey/shared/routes.dart';


class KButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final Widget child;
  final Color? primary;
  final Color? onPrimary;
  final OutlinedBorder? border;
  const KButton({this.onPressed,required this.child,this.primary,this.onPrimary,this.border});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: MaterialStateProperty.all(primary),
        foregroundColor: MaterialStateProperty.all(onPrimary),
        shape: MaterialStateProperty.all(border)
      )
    );
  }
}
// Sign Up page
class KTextFormField extends StatelessWidget {

  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final bool enabled;

  const KTextFormField({this.hint,this.controller, this.label,this.enabled=true});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: enabled ? null : TextStyle(color:Colors.grey),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          label: label !=null ? Text(label!) : null,
          labelStyle: Theme.of(context).textTheme.bodyText2,
          enabled: enabled,
          filled: true,
          fillColor: enabled ? Color(0xfff2f2f2) : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none
          ),
          contentPadding:const EdgeInsets.fromLTRB(30,25,30,25),
        ),
      ),
      margin:const EdgeInsets.only(bottom: 20.0),
    );
  }
}

// Profile Page
class KInteractiveTextForm extends StatefulWidget {

  final String? hint;
  final String? label;
  final TextEditingController? controller;
  bool enabled;
  
  KInteractiveTextForm({this.hint, this.label, this.controller,this.enabled=false});

  @override
  _KInteractiveTextFormState createState() => _KInteractiveTextFormState();
}


class _KInteractiveTextFormState extends State<KInteractiveTextForm> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [

        KTextFormField(
          label: widget.label,
          hint: widget.hint,
          controller: widget.controller,
          enabled: widget.enabled,
        ),

        Container(
          padding: const EdgeInsets.all(10.0),
          margin:  const EdgeInsets.only(right:6,top: 12),            
          child: InkWell(
            onTap: () {
              setState(() {
                widget.enabled = !widget.enabled;
              });
            },
            child: Icon(Icons.edit,color: widget.enabled ? Colors.black:Colors.grey)
          ),
        ),

      ],
    );
  }
}


            // Main application
AppBar kAppBar(String leading,)
{
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left:16.0),
      child: Text(leading,style: TextStyle(color: Color(0xff414143),fontWeight: FontWeight.bold,fontSize: 26),),
    ),
    leadingWidth: 160,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right:16.0),
        child: Icon(Icons.shopping_cart,size: 30,color: Color(0xff414143),),
      )
    ],
    

    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
  );
}


                // Main Application
class KBottomNavigationBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit,int>(
      builder: (context,index){
        
        return Container(
          height: 95,
          child: BottomNavigationBar(

            currentIndex: index,
            onTap: (i) {
              BlocProvider.of<BottomNavCubit>(context).move(i);
            },
            

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more),
                label: 'More',
              ),
            ],

          ),
        );
      
      },
    );
  }
}

                // Profile Page
void Function() kZoomTheImage(BuildContext context,Widget widget)
{
  return ()=> Scaffold.of(context).showBottomSheet(
    (_) => InkWell(onTap:()=>Navigator.pop(context),child: Container(child: widget,height: 900,))
  );
}




                // More Page
class KListTile extends StatelessWidget {

  final Widget leading;
  final Widget title;
  final VoidCallback? onTap;

  const KListTile({required this.leading, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:16.0),
      child: Row(
        children: [

          Expanded(
            child: ListTile(
              onTap: onTap,
              leading: Container(
                child: leading,
                width: 55.0,
                height: 55.0,
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD8D8D8).withOpacity(0.7)
                )
              ),
              title: title,
              contentPadding: const EdgeInsets.all(16),
              tileColor: Color(0xffF6F6F6),
            ),
          ),

          Transform.translate(
            offset: Offset(-23, 0),
            child: Container(
              child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEDEBEB).withOpacity(0.6)
              ),
            ),
          ),

        ],
      ),
    );
  }
}


// Menu Page

class KListTile2 extends StatelessWidget {

  final CircleAvatar image;
  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  
  const KListTile2({required this.image, required this.title, required this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:30.0),
      child: Container(
        child: ListTile(
          onTap: onTap,
          leading: Transform.translate(
            offset: Offset(-45,1),
            child: InkWell(child: image,onTap: kZoomTheImage(context,image),)
          ),
          title:    Text(title,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 23)),
          subtitle: Text(subTitle,style: Theme.of(context).textTheme.bodyText2),
          // trailing: ,
          contentPadding: const EdgeInsets.all(10),
          trailing: Transform.translate(
            offset: Offset(35, 0),
            child: Container(
              child: Icon(Icons.arrow_forward_ios,color: Colors.red,),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEDEBEB).withOpacity(0.8)
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
            )
          ]
        ),
      ),
    );
  }
}