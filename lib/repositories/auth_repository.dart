

import 'dart:convert';

import 'package:dio/dio.dart';

abstract class ServiceRepository {
  late Dio dio;
  Future<void> initializeServices();
}


class ServiceInitializeRepository extends ServiceRepository {
  @override
  Future<void> initializeServices() async {
    dio = Dio(
        BaseOptions(
            baseUrl: "http://localhost:8080/api/match-making",
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers:{
              'Content-Type': 'application/json',
              'Authorization': 'Basic YWxwaGE6cGFzc3dvcmQ='
            }
        )
    );
  }

}



class AuthRepository extends ServiceRepository {

  @override
  Future<void> initializeServices() async {
     dio = Dio(
        BaseOptions(
          baseUrl: "http://localhost:8080/api/match-making",
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          headers:{
            'Content-Type': 'application/json',
            'Authorization': 'Basic YWxwaGE6cGFzc3dvcmQ='
          }
        )
    );
  }


  Future<Response> registerThroughEmailService(Map<String, dynamic> data) async {
      var response = await dio.post(
        '/signup',
        data: data,
      );
      if (response.statusCode == 200) {
        print(json.encode(response.data));
      }
      else {
        print(response.statusMessage);
      }

      return response;
  }

  Future<Response> loginService(Map<String, dynamic> data) async {
    var response = await dio.post(
      '/login',
      data: data,
    );
    return response;
}











}