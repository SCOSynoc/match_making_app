

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_making/bloc/ProfileBloc/profile_events.dart';
import 'package:match_making/bloc/ProfileBloc/profile_states.dart';
import 'package:match_making/domain/usecases/profile_cases.dart';
import 'package:match_making/local_storage/hive_service.dart';
import 'package:match_making/repositories/profile_repository.dart';
import 'package:match_making/utils/constant.dart';

import '../../models/profile/profile.dart';
import '../../utils/navigation.dart';

class ProfileBloc extends Bloc<ProfileEvents,ProfileStates> {

  ProfileBloc() : super(ProfileInitial()) {
    on<StoreProfileDataLocallyReq>(_onDataStoreLocallyReq);
    on<GetLocallyStoreProfileData>(_onLocalStoreProfileDataRequested);
    on<StoreProfileDataToDatabase>(_onStoreProfileToDatabaseReq);
  }

  final HiveService _hiveService = HiveService()..initLocalService();
  ProfileRepository repository = ProfileRepository()..initializeServices();

  void _onDataStoreLocallyReq(StoreProfileDataLocallyReq event, Emitter<ProfileStates> emit) async{

    /*final data = _hiveService.getData(key: profileDataLocal);*/
    /*if(data == null) {*/
      _hiveService.addData(
        key: profileDataLocal,
        value: jsonEncode({"profileData": event.profile.toJson()}
        ),
      );
    /*}*//*else{
      data['profileData'] = event.profile.toJson();
      _hiveService.addData(key: profileDataLocal, value: jsonEncode({"profileData" : data['profileData']}));
    }*/

    emit(DataStoredLocallySuccess(message: "Success"));

    add(GetLocallyStoreProfileData());

  }

  void _onLocalStoreProfileDataRequested(GetLocallyStoreProfileData event, Emitter<ProfileStates> emit) {
    try {
      final data = _hiveService.getData(key: profileDataLocal);
      Map<String,dynamic> decodedData = jsonDecode(data);
      emit(GotLocallyStoredProfileData(profile: Profile.fromJson(decodedData["profileData"])));
    }catch(e){
      log("Error in log for Getting data is ${e}");
    }


  }

  void _onStoreProfileToDatabaseReq(StoreProfileDataToDatabase event,
      Emitter<ProfileStates> emit) async {

    try {
      Response response = await CreateUserProfile(repository).call(event.profile);
      if(response.statusCode == 201) {
        log("The onStoreProfileToDatabaseReq :: () :: ${response.data}");
        emit(ProfileDataStoredInDatabaseSuccess());
      }else{
        log("The onStoreProfileToDatabaseReq :: () :: ${response.statusMessage}");
        emit(ProfileDataStoredInDatabaseFailed());
      }
    } catch (e) {
      print("The onStoreProfileToDatabaseReq :: () :: error in catch $e");
      showSnackBar(context: event.context, content: e.toString(), onPressed: () {});
    }

   }

}