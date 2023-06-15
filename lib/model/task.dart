// ignore_for_file: public_member_api_docs
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';

enum TaskStatus { done, removed, established, standart }

enum TaskImportance { absent, low, high }

///
@freezed
class Task with _$Task {
  factory Task({
    required Uuid id,
    required String text,
    required TaskImportance importance,
    required DateTime deadline,
    required bool done,
    required String color,
    required DateTime createdAt,
    required DateTime changedAt,
    required int deviceId,
  }) = _Task;
}

List<String> _fakeName = ['123', 'что-то', 'сходить в магазин'];

class FakeTaskRepository extends GetxController {
  final List<Task> _taskArray = List.generate(
    _fakeName.length,
    (index) => Task(
      id: const Uuid(),
      text: _fakeName[index],
      importance: TaskImportance.absent,
      deadline: DateTime.now().add(const Duration(hours: 10)),
      done: false,
      color: 'FFFFFFFF',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      changedAt: DateTime.now().subtract(const Duration(days: 1)),
      deviceId: index,
    ),
  ).obs;

  int get length => _taskArray.length;

  void createTask(Task task) {
    if (!_taskArray.contains(task)) {
      _taskArray.add(task);
    }
  }

  void removeTask(Task task) {
    _taskArray.removeWhere((element) => element == task);
  }

  void editTask(Task task) {
    final index = _taskArray.indexWhere((element) => element.id == task.id);
    _taskArray[index] = task;
  }

  Task getTaskByIndex(int index) {
    return _taskArray[index];
  }
}
