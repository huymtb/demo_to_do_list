import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

/// this class use to manage the global state for whole app,
/// such as theme mode (dark/light)
abstract class _TaskStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool enableDoneButton = false;

  @observable
  Map? priority;

  @observable
  bool completed = false;

  @observable
  DateTime? dueDate;

  @observable
  DateTime? completedDate;

  @action
  void enableButton(String title) {
    enableDoneButton = title.isNotEmpty;
  }

  @action
  void togglePriority(Map selectedPriority) {
    priority = selectedPriority;
  }

  @action
  void toggleCompleted() {
    completed = !completed;
  }
}
