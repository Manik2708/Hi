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
  final String status;
  @HiveField(7)
  final String crushName;
  ConfessionModel({required this.senderId, required this.senderAnonymousId, required this.crushId, required this.confession, required this.time, required this.id, required this.status, required this.crushName});

  factory ConfessionModel._confessionFromJson(Map<String, dynamic> json)=>ConfessionModel(
    id: json['_id'] as String,
    senderId: json['SenderId'] as String,
    senderAnonymousId: json['SenderAnonymousId'] as String,
    crushId: json['CrushId'] as String,
    confession: json['Confession'] as String,
    time: json['Time'] as String,
    status: json['status'] as String,
    crushName: json['crushName'] as String
  );
  Map<String, dynamic> _confessionToJson(ConfessionModel instance) => <String, dynamic>{
    '_id': instance.id,
    'SenderId': instance.senderId,
    'SenderAnonymousId': instance.senderAnonymousId,
    'CrushId': instance.crushId,
    'Confession': instance.confession,
    'Time': instance.time,
    'status': instance.status,
    'crushName': instance.crushName
  };
  factory ConfessionModel.fromJson(Map<String, dynamic> json)=>ConfessionModel._confessionFromJson(json);
  String toJson(ConfessionModel confession)=>jsonEncode(_confessionToJson(confession));
}