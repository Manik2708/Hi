// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confession.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfessionModelAdapter extends TypeAdapter<ConfessionModel> {
  @override
  final int typeId = 2;

  @override
  ConfessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfessionModel(
      senderId: fields[0] as String,
      senderAnonymousId: fields[1] as String,
      crushId: fields[2] as String,
      confession: fields[3] as String,
      time: fields[4] as String,
      id: fields[5] as String,
      status: fields[6] as String,
      crushName: fields[7] as String,
      previousConfessionId: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConfessionModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.senderId)
      ..writeByte(1)
      ..write(obj.senderAnonymousId)
      ..writeByte(2)
      ..write(obj.crushId)
      ..writeByte(3)
      ..write(obj.confession)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.crushName)
      ..writeByte(8)
      ..write(obj.previousConfessionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
