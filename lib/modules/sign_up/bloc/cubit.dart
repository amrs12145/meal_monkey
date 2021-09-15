import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';



class SignUpCubit extends Cubit<SignUpStates>
{
  //AuthenticationCubit(AuthenticationState initialState) : super(initialState);
  SignUpCubit() : super(Intial());


  final TextEditingController emailController     = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();
  


  Future<void> signUpWithEmailAndPassword() async {

    emit(Loading());

    try
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      print('Successfully SignUp');
      emit(SignedUpSuccessfully());
    }
    on FirebaseException catch (e)
    {
      checkErrorCode(e);
      emit(Error(e));
    }

  }

  Future<void> signOut() async{

    emit(Loading());

    try
    {
      emailController.clear();
      passwordController.clear();
      await FirebaseAuth.instance.signOut();
      emit(Intial());
    }
    catch (e)
    {
      print('Can\'t Sign-Out $e ');
    }

  }


  void checkErrorCode(FirebaseException e)
  {
    switch(e.code)
    {
      case 'email-already-in-use':
        print('email-already-in-use');
        break;

      case 'invalid-email':
        print('invalid-email');
        break;

      case 'operation-not-allowed':
        print('operation-not-allowed');
        break;

      case 'weak-password':
        print('weak-password');
        break;


      case 'user-disabled':
        print('user-disabled');
        break;

      case 'user-not-found':
        print('user-not-found');
        break;

      case 'wrong-password':
        print('wrong-password');
        break;

      default:
        print('Error i don\'t know');
        break;
    }
  }

}