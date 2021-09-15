
import 'package:flutter/material.dart';


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

class KTextFormField extends StatelessWidget {

  final String? hint;
  final TextEditingController? controller;
  const KTextFormField({this.hint,this.controller});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText2,
          filled: true,
          fillColor: Color(0xfff2f2f2),
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