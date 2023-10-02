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
    name: json['name'] as String,
    email: json['email'] as String,
    anonymousId: json['anonymousId'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    dob: json['dob'] as String,
    isEmailVerified: json['isEmailVerified'] as bool,
    token: json['token']??'' as String,
    id: json['_id'] as String,
    sentConfessions: json['sentConfessionsList']!=null?List<ConfessionModel>.from(json['sentConfessionsList'].map((x)=>ConfessionModel.fromJson(x))):[],
    recievedConfessions: json['recievedConfessionsList']!=null?List<ConfessionModel>.from(json['recievedConfessionsList'].map((x)=>ConfessionModel.fromJson(x))):[]
  );
  factory UserWithChats.fromJson(Map<String, dynamic> json)=>UserWithChats._userFromJson(json);
}