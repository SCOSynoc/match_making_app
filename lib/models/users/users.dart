import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';

part 'users.g.dart';


@freezed
class Users with _$Users {
  const factory Users(
  {
    required String? phoneNumber,
    required String email,
    required String password,
    required double latitude,
    required double longitude,
  }) =_Users;

  factory Users.fromJson(Map<String, dynamic> json)
  => _$UsersFromJson(json);
}