import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


class User{
  final String name;
  final String email;
  final String anonymousId;
  final String username;
  final String password;
  final String dob;
  final bool isEmailVerified;
  final String token;
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
    name: json['name'] as String,
    email: json['email'] as String,
    anonymousId: json['anonymousId'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    dob: json['dob'] as String,
    isEmailVerified: json['isEmailVerified'] as bool,
    token: json['token']??'' as String,
    id: json['_id'] as String,
  );

  Map<String, dynamic> _userToJson(User instance) => <String, dynamic>{
    'name': instance.name,
    'email': instance.email,
    'anonymousId': instance.anonymousId,
    'username': instance.username,
    'password': instance.password,
    'dob': instance.dob.toString(),
    'isEmailVerified': instance.isEmailVerified.toString(),
    'token': instance.token,
    '_id': instance.id
  };
  User fromJson(Map<String, dynamic> json)=>_userFromJson(json);
  String toJson(User user)=>jsonEncode(_userToJson(user));
}

