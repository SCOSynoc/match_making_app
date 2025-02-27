

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/AuthBloc/auth_events.dart';
import 'package:match_making/bloc/AuthBloc/auth_states.dart';
import 'package:match_making/domain/usecases/auth_cases.dart';
import 'package:match_making/local_storage/hive_service.dart';
import 'package:match_making/repositories/auth_repository.dart';
import 'package:match_making/utils/navigation.dart';

class AuthBloc extends Bloc<AuthEvents,AuthStates> {

  AuthBloc() : super(AuthInitial()) {
    on<EmailSignUpRequested>(_onEmailSignUpRequested);
    on<LoginUserRequested>(_onLoginUserRequest);
  }


  AuthRepository repository = AuthRepository()..initializeServices();
  HiveService _hiveService = HiveService()..initLocalService();

  void _onEmailSignUpRequested(EmailSignUpRequested event, Emitter<AuthStates> emit) async{
      try {
        Response response = await AddUsersByEmail(repository).call(event.users);
        if(response.statusCode == 201) {
           print(response.data["id"]);
          _hiveService.addData(key: "UserId", value: jsonEncode(response.data["id"]));
          emit(EmailSignupSuccess());

        }
      } catch (e) {
        print("The error in catch $e");
        emit(EmailSignupFailure(failMessage: e.toString()));
        showSnackBar(context: event.context, content: e.toString(), onPressed: () {});
      }
  }

  void _onLoginUserRequest(LoginUserRequested event, Emitter<AuthStates> emit)async {
    try{
      Response response =  await LoginUser(repository).call(event.email, event.password);
      if(response.statusCode == 302) {

      }else{
        showSnackBar(context: event.context, content: "${response.statusMessage}", onPressed: () {});
      }

    }catch(e) {
      emit(LoginFailed(failMessage: e.toString()));
      showSnackBar(context: event.context, content: "Check your credentials and try again", onPressed: () {});
    }

  }



}
