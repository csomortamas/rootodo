// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListElementAdapter extends TypeAdapter<ListElement> {
  @override
  final int typeId = 0;

  @override
  ListElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListElement(
      title: fields[0] as String,
      deadline: fields[1] as DateTime,
      durationMinutes: fields[2] as int,
    )..timeLeftMinutes = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, ListElement obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.deadline)
      ..writeByte(2)
      ..write(obj.durationMinutes)
      ..writeByte(3)
      ..write(obj.timeLeftMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
