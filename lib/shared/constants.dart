
import 'package:flutter/material.dart';

ThemeData? kThemeData(BuildContext context)
{
  return ThemeData(
    //primarySwatch: Colors.orange,
    primaryColor: Color(0xfffc6111),
    accentColor: Colors.white,
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xfffc6111),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        minimumSize:Size(250,40),
        padding: EdgeInsets.all(20.0),
        textStyle: TextStyle(
          color:Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.bold
        )
      )
    ),

    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Color(0xffaaabab),
        fontSize: 16
      ),
      bodyText1: TextStyle(
        color: Color(0xff414143),
        fontWeight: FontWeight.w900,
        fontSize: 30
      ),
    )
  );
}