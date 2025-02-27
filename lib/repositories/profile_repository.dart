

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:match_making/repositories/auth_repository.dart';

class ProfileRepository extends ServiceInitializeRepository {


 Future<Response> createUserProfileApiCall(Map<String, dynamic> data) async{

    var response = await dio.post(
      "/create-profile",
      data: data,
    );
      if (response.statusCode == 201) {
        print(response.data);
      }
      else {
        print(response.statusMessage);
      }

    return response;
  }



}