

import 'package:dio/dio.dart';

import '../../local_storage/hive_service.dart';
import '../../models/users/users.dart';
import '../../repositories/auth_repository.dart';

class AddUsersByEmail {
  final AuthRepository repository;

  AddUsersByEmail(this.repository);

  Future<Response> call(Users user) async {
    return  await repository.registerThroughEmailService(user.toJson());
  }
}

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Response> call(String email, String password) async {
    return  await repository.loginService({"email": email, "password":password});
  }

}