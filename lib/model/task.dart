enum TaskStatus { done, removed, established }

class Task {
  Task(this.text,
      {importance: true,
      limit: DateTime.now(),
      status: TaskStatus.established});

  String text;
  bool importance;
  DateTime limit;
  TaskStatus status;
}
