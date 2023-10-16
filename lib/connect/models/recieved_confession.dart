import 'dart:convert';

class RecievedConfessionModel{
  final String senderId;
  final String senderAnonymousId;
  final String confession;
  final String time;
  final String id;

  RecievedConfessionModel({required this.id, required this.senderId, required this.senderAnonymousId, required this.confession, required this.time});
  factory RecievedConfessionModel._recievedConfessionFromJson(Map<String, dynamic> json)=>RecievedConfessionModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderAnonymousId: json['senderAnonymousId'] as String,
      confession: json['confession'] as String,
      time: json['time'] as String,
  );
  Map<String, dynamic> _recievedConfessionToJson(RecievedConfessionModel instance) => <String, dynamic>{
    'id': instance.id,
    'senderId': instance.senderId,
    'senderAnonymousId': instance.senderAnonymousId,
    'confession': instance.confession,
    'time': instance.time,
  };
  factory RecievedConfessionModel.fromJson(Map<String, dynamic> json)=>RecievedConfessionModel._recievedConfessionFromJson(json);
  String toJson(RecievedConfessionModel confession)=>jsonEncode(_recievedConfessionToJson(confession));
}