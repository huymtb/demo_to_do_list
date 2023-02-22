import 'package:todo/local_db/local_database.dart';
import 'package:todo/model/task_model.dart';

class TodoRepository {
  Future<void> insertTodo(TaskModel task) async {
    await LocalDatabase.db.insertTask(task);
  }

  Future<List<TaskModel>> getAllTasks() async {
    return await LocalDatabase.db.getTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await LocalDatabase.db.update(task);
  }

  Future<void> deleteTask(TaskModel task) async {
    await LocalDatabase.db.delete(task.id ?? 0);
  }
}
