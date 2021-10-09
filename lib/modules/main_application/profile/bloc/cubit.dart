import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';
import 'states.dart';

class UserCubit extends Cubit<UserStates>
{
  UserCubit(UserStates intialState) : super(intialState)
  {
    currentUser = getData();
  }

  late Future<User> currentUser;

  final TextEditingController nameController      = TextEditingController();
  final TextEditingController emailController     = TextEditingController();
  final TextEditingController mobileController    = TextEditingController();
  final TextEditingController addressController   = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();
  
  Future<User> getData() async
  {
    try
    {
      // final doc = await FirebaseFirestore.instance.collection('users').where('id',isEqualTo: firebase.FirebaseAuth.instance.currentUser!.uid).get();
      final doc = await FirebaseFirestore.instance.collection('users').doc( firebase.FirebaseAuth.instance.currentUser!.uid ).get();
      final userModel = User.fromJson( doc.data()! );
      nameController.text     = userModel.name;
      emailController.text    = userModel.email;
      passwordController.text = userModel.password;
      if(userModel.mobile !=null) mobileController.text = userModel.mobile!;
      if(userModel.address!=null) addressController.text  = userModel.address!;
      emit(Done());
      return userModel;
    }
    catch(e)
    {
      print(e);
      emit(Error());
      return Future.error(e);
    }

  }

  void editData() async
  {
    try
    {
      // FirebaseFirestore.instance.collection('users').where('id',isEqualTo: firebase.FirebaseAuth.instance.currentUser!.uid)
      FirebaseFirestore.instance.collection('users').doc( firebase.FirebaseAuth.instance.currentUser!.uid ).update({
        'name'     : nameController.text,
        'email'    : emailController.text,
        'mobile'   : mobileController.text,
        'address'  : addressController.text,
        'password' : passwordController.text
      });
      
    }
    catch(e)
    {
      print(e);
    }

  }

}