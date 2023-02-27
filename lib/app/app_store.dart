import 'package:mobx/mobx.dart';
import 'package:todo/local_db/local_database.dart';
import 'package:todo/model/task_model.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

/// this class use to manage the global state for whole app,
/// Task is manage between 2 pages, so we use global state
/// to manage state
abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<TaskModel> taskInProgressList = ObservableList<TaskModel>();

  @observable
  ObservableList<TaskModel> taskCompletedList = ObservableList<TaskModel>();

  @observable
  bool hideCompleted = false;

  @observable
  int sortBy = 0; // 0: updatedAt, 1: name, 2: priority

  @action
  Future<void> getAllTasks() async {
    isLoading = true;
    Future.wait([
      getTasksInProgress(),
      getTasksCompleted(),
    ]);
  }

  Future<void> getTasksInProgress() async {
    LocalDatabase.db.getTasksInProgress().then((list) {
      runInAction(() {
        taskInProgressList = ObservableList.of(list);
        isLoading = false;
      });
    });
  }

  Future<void> getTasksCompleted() async {
    LocalDatabase.db.getTasksCompleted().then((list) {
      runInAction(() {
        taskCompletedList = ObservableList.of(list);
        isLoading = false;
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
        sortTheListInProgress(sortBy);
      });
    });
  }

  @action
  Future<void> updateTask(TaskModel task) async {
    await LocalDatabase.db.update(task);

    // task is completed
    if (task.completed == 0) {
      final foundIndex =
          taskCompletedList.indexWhere((element) => element.id == task.id);

      // if task could find in completed list
      // update the completed list
      if (foundIndex != -1) {
        taskCompletedList.removeAt(foundIndex);
        taskCompletedList.insert(foundIndex, task);
      }
      // The task could not find in the completed list
      // the task is inserted into the completed list
      // and removed from in progress list
      else {
        taskCompletedList.insert(0, task);
        taskInProgressList.removeWhere((element) => element.id == task.id);
      }
    }
    // task is in-progress
    else {
      final foundIndex =
          taskInProgressList.indexWhere((element) => element.id == task.id);
      if (foundIndex != -1) {
        taskInProgressList.removeAt(foundIndex);
        taskInProgressList.insert(foundIndex, task);
      } else {
        taskInProgressList.insert(0, task);
        taskCompletedList.removeWhere((element) => element.id == task.id);
      }
    }
    sortTheListInProgress(sortBy);
  }

  @action
  Future<void> deleteTask(int isFirstState, int taskId) async {
    if (isFirstState == 0) {
      taskCompletedList.removeWhere((element) => element.id == taskId);
    } else {
      taskInProgressList.removeWhere((element) => element.id == taskId);
    }
    await LocalDatabase.db.delete(taskId);
  }

  @action
  void toggleHideCompleted() {
    hideCompleted = !hideCompleted;
  }

  @action
  void sortTheListInProgress(int index) {
    sortBy = index;
    if (index == 1) {
      taskInProgressList.sort((taskA, taskB) =>
          taskA.title!.toLowerCase().compareTo(taskB.title!.toLowerCase()));
    } else if (index == 2) {
      taskInProgressList
          .sort((taskA, taskB) => taskA.priority!.compareTo(taskB.priority!));
    } else {
      taskInProgressList.sort(
          (taskA, taskB) => taskB.updatedDate!.compareTo(taskA.updatedDate!));
    }
  }
}
