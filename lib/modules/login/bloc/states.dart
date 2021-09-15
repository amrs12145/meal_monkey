
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInStates
{
}

class Intial extends SignInStates {}

class Loading extends SignInStates {}

class SignedInSuccessfully extends SignInStates {}

class Error extends SignInStates {
  final FirebaseException exception;
  Error(this.exception);
}
