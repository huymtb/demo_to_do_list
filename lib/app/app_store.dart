import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:todo/local_db/local_database.dart';
import 'package:todo/model/task_model.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

/// this class use to manage the global state for whole app,
/// such as theme mode (dark/light)
abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<TaskModel> taskInProgressList = ObservableList<TaskModel>();

  @observable
  ObservableList<TaskModel> taskCompletedList = ObservableList<TaskModel>();

  @action
  Future<void> getAllTasks() async {
    isLoading = true;
    Future.wait([
      getTasksInProgress(),
      getTasksCompleted(),
    ]);
    isLoading = false;
  }

  Future<void> getTasksInProgress() async {
    LocalDatabase.db.getTasksInProgress().then((list) {
      runInAction(() {
        taskInProgressList = ObservableList.of(list);
      });
    });
  }

  Future<void> getTasksCompleted() async {
    LocalDatabase.db.getTasksCompleted().then((list) {
      runInAction(() {
        taskCompletedList = ObservableList.of(list);
      });
    });
  }

  @action
  Future<void> addTask(TaskModel task) async {
    isLoading = true;
    await LocalDatabase.db.insertTask(task).then((addedTask) {
      runInAction(() {
        taskInProgressList.insert(0, addedTask);
        isLoading = false;
      });
    });
  }

  @action
  Future<void> updateTask(TaskModel task) async {
    await LocalDatabase.db.update(task);
    if (task.completed == 0) {
      final foundItem = taskCompletedList
          .firstWhereOrNull((element) => element.id == task.id);
      if (foundItem != null) {
        foundItem.title = task.title;
        foundItem.description = task.description;
        foundItem.dueDate = task.dueDate;
        foundItem.updatedDate = task.updatedDate;
        foundItem.priority = task.priority;
        foundItem.completed = task.completed;
      } else {
        taskCompletedList.insert(0, task);
        taskInProgressList.removeWhere((element) => element.id == task.id);
      }
    } else {
      final foundItem = taskInProgressList
          .firstWhereOrNull((element) => element.id == task.id);
      if (foundItem != null) {
        foundItem.title = task.title;
        foundItem.description = task.description;
        foundItem.dueDate = task.dueDate;
        foundItem.updatedDate = DateTime.now();
        foundItem.priority = task.priority;
        foundItem.completed = task.completed;
      } else {
        taskInProgressList.insert(0, task);
        taskCompletedList.removeWhere((element) => element.id == task.id);
      }
    }
  }

  @action
  Future<void> deleteTask(int isFirstState, int taskId) async {
    if (isFirstState == 0) {
      taskCompletedList.removeWhere((element) => element.id == taskId);
    } else {
      taskInProgressList.removeWhere((element) => element.id == taskId);
    }
  }
}
