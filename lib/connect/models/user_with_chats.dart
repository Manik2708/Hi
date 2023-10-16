import 'package:hi/constants/global_variables.dart';
import 'package:hive/hive.dart';
import 'package:hi/connect/models/confession.dart';
import 'package:hi/connect/models/user.dart';
import 'package:hive_flutter/adapters.dart';

part 'user_with_chats.g.dart';
@HiveType(typeId: 1)
class UserWithChats extends User {
  @HiveField(9)
  final List<ConfessionModel>? sentConfessions;
  @HiveField(10)
  final List<ConfessionModel>? recievedConfessions;
  UserWithChats({
    required super.name,
    required super.email,
    required super.anonymousId,
    required super.username,
    required super.password,
    required super.dob,
    required super.isEmailVerified,
    required super.token,
    required super.id,
    required this.sentConfessions,
    required this.recievedConfessions
  });
  factory UserWithChats._userFromJson(Map<String, dynamic> json) => UserWithChats(
    name: json[UserModelJsonController.name] as String,
    email: json[UserModelJsonController.email] as String,
    anonymousId: json[UserModelJsonController.anonymousId] as String,
    username: json[UserModelJsonController.username] as String,
    password: json[UserModelJsonController.password] as String,
    dob: json[UserModelJsonController.dob] as String,
    isEmailVerified: json[UserModelJsonController.isEmailVerified] as bool,
    token: json[UserModelJsonController.token]??'' as String,
    id: json[UserModelJsonController.id] as String,
    sentConfessions: json[UserModelJsonController.sentConfessionList]!=null?List<ConfessionModel>.from(json[UserModelJsonController.sentConfessionList].map((x)=>ConfessionModel.fromJson(x))):[],
    recievedConfessions: json[UserModelJsonController.recievedConfessionList]!=null?List<ConfessionModel>.from(json[UserModelJsonController.recievedConfessionList].map((x)=>ConfessionModel.fromJson(x))):[]
  );
  factory UserWithChats.fromJson(Map<String, dynamic> json)=>UserWithChats._userFromJson(json);
}