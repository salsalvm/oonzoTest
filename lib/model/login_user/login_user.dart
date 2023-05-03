import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'login_user.g.dart';

@JsonSerializable()
class LoginUser {
  bool status;
  String? message;
  Data? data;

  LoginUser({this.status=false, this.message, this.data});

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return _$LoginUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
