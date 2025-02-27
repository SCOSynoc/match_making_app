import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

part 'profile.g.dart';

@freezed
class Profile with _$Profile {
    const factory Profile({
      int? user_id,
      String? first_name,
      String? last_name,
      String? gender,
      int? age,
      String? bio,
      List<String>? interests,
      String? looking_for,
      List<String>? photos,
   })= _Profile ;

    factory Profile.fromJson(Map<String, dynamic> json)
    => _$ProfileFromJson(json);
}