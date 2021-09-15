
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpStates
{
}

class Intial extends SignUpStates {}

class Loading extends SignUpStates {}

class SignedUpSuccessfully extends SignUpStates {}

class Error extends SignUpStates {
  final FirebaseException exception;
  Error(this.exception);
}
