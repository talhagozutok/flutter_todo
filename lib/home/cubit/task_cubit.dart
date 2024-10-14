import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository _taskRepository;

  TaskCubit(this._taskRepository) : super(TaskLoading()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final tasks = await _taskRepository.getTasks();
      emit(TaskLoaded(tasks));
    } catch (_) {
      emit(TaskError());
    }
  }

  Future<void> saveTask(Task task) async {
    try {
      await _taskRepository.saveTask(task);
      final currentState = state;
      if (currentState is TaskLoaded) {
        final updatedTasks = List<Task>.from(currentState.tasks)..add(task);
        emit(TaskLoaded(updatedTasks));
      }
    } catch (_) {
      emit(TaskError());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _taskRepository.saveTask(task);
      final currentState = state;
      if (currentState is TaskLoaded) {
        final updatedTasks = currentState.tasks.map((t) {
          return t.id == task.id ? task : t;
        }).toList();
        emit(TaskLoaded(updatedTasks));
      }
    } catch (_) {
      emit(TaskError());
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _taskRepository.deleteTask(id);
      final currentState = state;
      if (currentState is TaskLoaded) {
        final updatedTasks =
            currentState.tasks.where((t) => t.id != id).toList();
        emit(TaskLoaded(updatedTasks));
      }
    } catch (_) {
      emit(TaskError());
    }
  }
}
