
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:match_making/models/profile/profile.dart';


@immutable
sealed class ProfileEvents extends Equatable {}


class CreateProfile extends ProfileEvents {

  @override
  List<Object?> get props => [];

}

class StoreProfileDataLocallyReq extends CreateProfile {
   final Profile profile;

   StoreProfileDataLocallyReq({required this.profile});

   @override
   List<Object?> get props => [profile];

}

class GetLocallyStoreProfileData extends CreateProfile {

  GetLocallyStoreProfileData();

  @override
  List<Object?> get props => [];

}

class StoreProfileDataToDatabase extends CreateProfile {

   final Profile profile;
   final BuildContext context;
   StoreProfileDataToDatabase({required this.profile,required this.context});

   @override
   List<Object?> get props => [profile];


}


