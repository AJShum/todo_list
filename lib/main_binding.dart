import 'package:get/get.dart';
import 'package:todo_list/model/task.dart';

class MainBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<FakeTaskRepository>(FakeTaskRepository());
  }
}
