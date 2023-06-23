// ignore_for_file: public_member_api_docs
import 'dart:developer';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@HiveType(typeId: 1, adapterName: 'StatusAdapter')
enum TaskStatus {
  @HiveField(0)
  done,
  @HiveField(1)
  removed,
  @HiveField(2)
  established,
  @HiveField(3)
  standart
}

@HiveType(typeId: 2, adapterName: 'ImportanceAdapter')
enum TaskImportance {
  @HiveField(0)
  absent,
  @HiveField(1)
  low,
  @HiveField(2)
  high
}

///
@freezed
class Task extends HiveObject with _$Task {
  @HiveType(typeId: 0, adapterName: 'TaskAdapter')
  factory Task({
    @HiveField(0) required String text,
    @HiveField(1) required String id,
    @HiveField(2) required TaskImportance importance,
    @HiveField(3) required DateTime deadline,
    @HiveField(4) required bool done,
    @HiveField(5) required String color,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) required DateTime changedAt,
    @HiveField(8) required int deviceId,
  }) = _Task;

  Task._();

  factory Task.empty() {
    return Task(
      id: const Uuid().v4(),
      text: '',
      importance: TaskImportance.absent,
      deadline: DateTime.now(),
      done: false,
      color: 'FFFFFFFF',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      changedAt: DateTime.now().subtract(const Duration(days: 1)),
      deviceId: 123,
    );
  }
}

List<String> _fakeName = ['123', 'что-то', 'сходить в магазин'];

class FakeTaskRepository {
  bool load = false;

  FakeTaskRepository() {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(TaskAdapter())
      ..registerAdapter(ImportanceAdapter())
      ..registerAdapter(StatusAdapter());

    Hive.openBox<Task>('testBox').then((value) => box = value);
  }

  Box<Task>? box;

  int get length => box == null ? 0 : box!.length;

  void createTask(Task task) {
    if (box != null) {
      box!.put(task.id, task);
    }
  }

  List<Task> getTasks() {
    log('[Repository] get all Task', name: 'info');
    if (box != null) {
      return box!.values.toList();
    } else {
      return [Task.empty()];
    }
  }

  void removeTask(Task task) {
    if (box != null) {
      box!.delete(task.id);
    }
  }

  void editTask(Task task) {
    if (box != null) {
      box!.put(task.id, task);
    }
  }

  Task? getTaskByIndex(int index) {
    if (box != null) {
      return box!.values.take(index).last;
    }
  }

  void addTask(Task task) {
    if (box != null) {
      box!.put(task.id, task);
    }
  }
}
