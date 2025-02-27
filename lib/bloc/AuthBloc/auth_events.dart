import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/users/users.dart';

@immutable
sealed class AuthEvents extends Equatable {}


class EmailSignUpRequested extends AuthEvents {
  final Users users;
  final BuildContext context;
  EmailSignUpRequested({required this.users,required this.context});

  @override
  List<Object> get props => [users];
}

class LoginUserRequested extends AuthEvents {
   final String email;
   final String password;
   final BuildContext context;

   LoginUserRequested({required this.password,required this.email,required this.context, });

   @override
   List<Object> get props => [email,password];

}