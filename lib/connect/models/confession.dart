import 'dart:convert';
import 'package:hive/hive.dart';
part 'confession.g.dart';
@HiveType(typeId: 2)
class ConfessionModel{
  @HiveField(0)
  final String senderId;
  @HiveField(1)
  final String senderAnonymousId;
  @HiveField(2)
  final String crushId;
  @HiveField(3)
  final String confession;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final String id;
  @HiveField(6)
  String status;
  @HiveField(7)
  final String crushName;
  @HiveField(8)
  String? previousConfessionId;
  ConfessionModel({required this.senderId, required this.senderAnonymousId, required this.crushId, required this.confession, required this.time, required this.id, required this.status, required this.crushName, this.previousConfessionId});

  factory ConfessionModel._confessionFromJson(Map<String, dynamic> json)=>ConfessionModel(
    id: json['_id'] as String,
    senderId: json['senderId'] as String,
    senderAnonymousId: json['senderAnonymousId'] as String,
    crushId: json['crushId'] as String,
    confession: json['confession'] as String,
    time: json['time'] as String,
    status: json['status'] as String,
    crushName: json['crushName'] as String
  );
  Map<String, dynamic> _confessionToJson(ConfessionModel instance) => <String, dynamic>{
    '_id': instance.id,
    'senderId': instance.senderId,
    'senderAnonymousId': instance.senderAnonymousId,
    'crushId': instance.crushId,
    'confession': instance.confession,
    'time': instance.time,
    'status': instance.status,
    'crushName': instance.crushName
  };
  factory ConfessionModel.fromJson(Map<String, dynamic> json)=>ConfessionModel._confessionFromJson(json);
  String toJson(ConfessionModel confession)=>jsonEncode(_confessionToJson(confession));
}