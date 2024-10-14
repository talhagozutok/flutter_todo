import 'package:task_api/task_api.dart';

abstract class TaskApi {
  const TaskApi();

  Future<List<Task>> getTasks();
  Future<void> saveTask(Task task);
  Future<void> deleteTask(String id);
}
