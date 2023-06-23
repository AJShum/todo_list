// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 1;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.done;
      case 1:
        return TaskStatus.removed;
      case 2:
        return TaskStatus.established;
      case 3:
        return TaskStatus.standart;
      default:
        return TaskStatus.done;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.done:
        writer.writeByte(0);
        break;
      case TaskStatus.removed:
        writer.writeByte(1);
        break;
      case TaskStatus.established:
        writer.writeByte(2);
        break;
      case TaskStatus.standart:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImportanceAdapter extends TypeAdapter<TaskImportance> {
  @override
  final int typeId = 2;

  @override
  TaskImportance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskImportance.absent;
      case 1:
        return TaskImportance.low;
      case 2:
        return TaskImportance.high;
      default:
        return TaskImportance.absent;
    }
  }

  @override
  void write(BinaryWriter writer, TaskImportance obj) {
    switch (obj) {
      case TaskImportance.absent:
        writer.writeByte(0);
        break;
      case TaskImportance.low:
        writer.writeByte(1);
        break;
      case TaskImportance.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskAdapter extends TypeAdapter<_$_Task> {
  @override
  final int typeId = 0;

  @override
  _$_Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Task(
      text: fields[0] as String,
      id: fields[1] as String,
      importance: fields[2] as TaskImportance,
      deadline: fields[3] as DateTime,
      done: fields[4] as bool,
      color: fields[5] as String,
      createdAt: fields[6] as DateTime,
      changedAt: fields[7] as DateTime,
      deviceId: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Task obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.importance)
      ..writeByte(3)
      ..write(obj.deadline)
      ..writeByte(4)
      ..write(obj.done)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.changedAt)
      ..writeByte(8)
      ..write(obj.deviceId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
