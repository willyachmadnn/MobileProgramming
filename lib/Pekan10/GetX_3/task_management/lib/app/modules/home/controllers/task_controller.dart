import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  void addTask(String title, {String description = ''}) {
    final newTask = TaskModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
    );
    tasks.add(newTask);
  }

  void deleteTask(String id) {
    tasks.removeWhere((task) => task.id == id);
  }

  void toggleTaskStatus(String id) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      tasks[index] = tasks[index].copyWith(
        isCompleted: !tasks[index].isCompleted,
      );
      tasks.refresh();
    }
  }

  int get totalTasks => tasks.length;
  int get completedTasks => tasks.where((task) => task.isCompleted).length;
}