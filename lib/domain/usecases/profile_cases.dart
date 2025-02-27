
import 'package:dio/dio.dart';
import 'package:match_making/repositories/profile_repository.dart';

import '../../models/profile/profile.dart';
import '../../models/users/users.dart';

class CreateUserProfile {
  final ProfileRepository repository;

  CreateUserProfile(this.repository);

  Future<Response> call(Profile profile) async {
    return  await repository.createUserProfileApiCall(profile.toJson());
  }
}