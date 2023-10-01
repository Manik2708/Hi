// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_chats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserWithChatsAdapter extends TypeAdapter<UserWithChats> {
  @override
  final int typeId = 1;

  @override
  UserWithChats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserWithChats(
      name: fields[0] as String,
      email: fields[1] as String,
      anonymousId: fields[2] as String,
      username: fields[3] as String,
      password: fields[4] as String,
      dob: fields[5] as String,
      isEmailVerified: fields[6] as bool,
      token: fields[7] as String,
      id: fields[8] as String,
        sentConfessions: [],
        recievedConfessions: []
    );
  }
  @override
  void write(BinaryWriter writer, UserWithChats obj) {
    writer
      ..writeByte(11)
      ..writeByte(9)
      ..write(obj.sentConfessions?.toList())
      ..writeByte(10)
      ..write(obj.recievedConfessions?.toList())
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.anonymousId)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.isEmailVerified)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserWithChatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
