import 'dart:convert';

class ConfessionModel{
  final String SenderId;
  final String SenderAnonymousId;
  final String CrushId;
  final String Confession;
  final String Time;
  final String id;
  final String status;

  ConfessionModel({required this.SenderId, required this.SenderAnonymousId, required this.CrushId, required this.Confession, required this.Time, required this.id, required this.status});

  factory ConfessionModel._confessionFromJson(Map<String, dynamic> json)=>ConfessionModel(
    id: json['_id'] as String,
    SenderId: json['SenderId'] as String,
    SenderAnonymousId: json['SenderAnonymousId'] as String,
    CrushId: json['CrushId'] as String,
    Confession: json['Confession'] as String,
    Time: json['Time'] as String,
    status: json['status'] as String
  );
  Map<String, dynamic> _confessionToJson(ConfessionModel instance) => <String, dynamic>{
    '_id': instance.id,
    'SenderId': instance.SenderId,
    'SenderAnonymousId': instance.SenderAnonymousId,
    'CrushId': instance.CrushId,
    'Confession': instance.Confession,
    'Time': instance.Time,
    'status': instance.status
  };
  factory ConfessionModel.fromJson(Map<String, dynamic> json)=>ConfessionModel._confessionFromJson(json);
  String toJson(ConfessionModel confession)=>jsonEncode(_confessionToJson(confession));
}