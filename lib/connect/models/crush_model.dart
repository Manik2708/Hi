import 'dart:convert';

class CrushModel{
  final String id;
  final String name;
  final String username;

  CrushModel({required this.id, required this.name, required this.username});
  factory CrushModel._crushFromJson(Map<String, dynamic> json)=>CrushModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
  );
  Map<String, dynamic> _crushToJson(CrushModel instance) => <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'username': instance.username
  };
  factory CrushModel.fromJson(Map<String, dynamic> json)=>CrushModel._crushFromJson(json);
  String toJson(CrushModel confession)=>jsonEncode(_crushToJson(confession));
}