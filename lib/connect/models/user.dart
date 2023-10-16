import 'dart:convert';
import 'package:hi/constants/global_variables.dart';
import 'package:hive/hive.dart';


part 'user.g.dart';
@HiveType(typeId: 0)
class User{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String anonymousId;
  @HiveField(3)
  final String username;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String dob;
  @HiveField(6)
  final bool isEmailVerified;
  @HiveField(7)
  final String token;
  @HiveField(8)
  final String id;
  User( {
    required this.name,
    required this.email,
    required this.anonymousId,
    required this.username,
    required this.password,
    required this.dob,
    required this.isEmailVerified,
    required this.token,
    required this.id,
});
  User _userFromJson(Map<String, dynamic> json) => User(
    name: json[UserModelJsonController.name] as String,
    email: json[UserModelJsonController.email] as String,
    anonymousId: json[UserModelJsonController.anonymousId] as String,
    username: json[UserModelJsonController.username] as String,
    password: json[UserModelJsonController.password] as String,
    dob: json[UserModelJsonController.dob] as String,
    isEmailVerified: json[UserModelJsonController.isEmailVerified] as bool,
    token: json[UserModelJsonController.token]??'' as String,
    id: json[UserModelJsonController.id] as String,
  );

  Map<String, dynamic> _userToJson(User instance) => <String, dynamic>{
    UserModelJsonController.name: instance.name,
    UserModelJsonController.email: instance.email,
    UserModelJsonController.anonymousId: instance.anonymousId,
    UserModelJsonController.username: instance.username,
    UserModelJsonController.password: instance.password,
    UserModelJsonController.dob: instance.dob.toString(),
    UserModelJsonController.isEmailVerified: instance.isEmailVerified.toString(),
    UserModelJsonController.token: instance.token,
    UserModelJsonController.id: instance.id
  };
  User fromJson(Map<String, dynamic> json)=>_userFromJson(json);
  String toJson(User user)=>jsonEncode(_userToJson(user));
}

