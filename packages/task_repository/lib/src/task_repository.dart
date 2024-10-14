import 'package:task_api/task_api.dart';

class TaskRepository {
  const TaskRepository({
    required TaskApi taskApi,
  }) : _taskApi = taskApi;

  final TaskApi _taskApi;

  Future<List<Task>> getTasks() => _taskApi.getTasks();

  Future<void> saveTask(Task task) => _taskApi.saveTask(task);

  Future<void> deleteTask(String id) => _taskApi.deleteTask(id);
}
