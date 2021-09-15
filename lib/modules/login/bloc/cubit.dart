import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';



class SignInCubit extends Cubit<SignInStates>
{
  //AuthenticationCubit(AuthenticationState initialState) : super(initialState);
  SignInCubit() : super(Intial());


  final TextEditingController emailController     = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();



  Future<void> signInWithEmailAndPassword() async{

    emit(Loading());

    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      emit(SignedInSuccessfully());

    }
    on FirebaseException catch (e)
    {
      checkErrorCode(e);
      emit(Error(e));
    }

  }

  Future<void> signInWithGoogle() async{

    emit(Loading());

    try
    {

      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(SignedInSuccessfully());

    }
    catch (e)
    {
      print(e);
      //checkErrorCode(e);
      //emit(Error(e));
    }

  }


  Future<void> signInWithFacebook() async{

    emit(Loading());

    try
    {
      /*
      final user = await FacebookAuth.instance.login();
      final credential = FacebookAuthProvider.credential(user.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      */

      final facebookLogin = FacebookLogin();
      //facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;

      final result = await facebookLogin.logIn(['email']);

      final credential = FacebookAuthProvider.credential(result.accessToken.token);
      
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(SignedInSuccessfully());

    }
    catch (e)
    {
      print('\n\n\n\nEEErroor\n$e\n\n\n\n');
      emit(Intial());
      //checkErrorCode(e);
      //emit(Error(e));
    }

  }

  Future<void> signInWithTwitter() async {

    emit(Loading());

    try
    {
      final login = TwitterLogin(
        consumerKey: 'd0pP1WhRWG8r69DeBBTm23E6v',
        consumerSecret:' ZKT9gI5MDtB9zvkPBxGI4iSoFYxK3XjvY6vSaK9TOY4GNb8XQX',
      );


      final result = await login.authorize();

      final session = result.session;

      final credential = TwitterAuthProvider.credential(
        accessToken: session.token,
        secret: session.secret,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      
      emit(SignedInSuccessfully());
    }
    catch (e)
    {
      print('\n\n\n\nEEErroor\n$e\n\n\n\n');
      emit(Intial());
    }

  }


  Future<void> signOut() async{

    emit(Loading());

    try
    {

      emailController.clear();
      passwordController.clear();


      if( await GoogleSignIn().isSignedIn() )
      {
        await GoogleSignIn().signOut();
      }
      else if ( await FacebookLogin().isLoggedIn )
      {
        await FacebookLogin().logOut();
      }
      else if ( await TwitterLogin( consumerKey: 'd0pP1WhRWG8r69DeBBTm23E6v',consumerSecret:' ZKT9gI5MDtB9zvkPBxGI4iSoFYxK3XjvY6vSaK9TOY4GNb8XQX').isSessionActive )
      {
        await TwitterLogin( consumerKey: 'd0pP1WhRWG8r69DeBBTm23E6v',consumerSecret:' ZKT9gI5MDtB9zvkPBxGI4iSoFYxK3XjvY6vSaK9TOY4GNb8XQX').logOut();
      }
      await FirebaseAuth.instance.signOut();
      emit(Intial());
      
     
    }
    catch (e)
    {
      print('Eception : Can\'t Sign-Out \n$e ');
      emit(Intial());
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