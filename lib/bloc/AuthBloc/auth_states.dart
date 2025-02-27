import 'package:flutter/cupertino.dart';

import '../../models/users/users.dart';


@immutable
sealed class AuthStates {}

class AuthInitial extends AuthStates {}

class SignupInitial extends AuthStates {}

class EmailSignupSuccess extends AuthStates {}

class EmailSignupFailure extends AuthStates {
  final String failMessage;
  EmailSignupFailure({required this.failMessage});
}

class LoginSuccess extends AuthStates {
  final Users user;
  LoginSuccess({required this.user});
}

class LoginFailed extends AuthStates {
  final String failMessage;
  LoginFailed({required this.failMessage});
}