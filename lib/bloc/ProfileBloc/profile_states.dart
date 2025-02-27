import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/profile/profile.dart';



@immutable
sealed class ProfileStates extends Equatable {}

class ProfileInitial extends ProfileStates {
  @override
  List<Object?> get props => [];
}

class DataStoredLocallySuccess extends ProfileStates {

  final String message;
  DataStoredLocallySuccess({required this.message});


  @override
  List<Object?> get props => [message];

}

class GotLocallyStoredProfileData extends ProfileStates {
  final Profile profile;
  GotLocallyStoredProfileData({required this.profile});


  @override
  List<Object?> get props => [profile];


}

class ProfileDataStoredInDatabaseSuccess extends ProfileStates {
  @override
  List<Object?> get props => [];

}

class ProfileDataStoredInDatabaseFailed extends ProfileStates {
  @override
  List<Object?> get props => [];

}