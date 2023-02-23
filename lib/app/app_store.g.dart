// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AppStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$taskInProgressListAtom =
      Atom(name: '_AppStore.taskInProgressList', context: context);

  @override
  ObservableList<TaskModel> get taskInProgressList {
    _$taskInProgressListAtom.reportRead();
    return super.taskInProgressList;
  }

  @override
  set taskInProgressList(ObservableList<TaskModel> value) {
    _$taskInProgressListAtom.reportWrite(value, super.taskInProgressList, () {
      super.taskInProgressList = value;
    });
  }

  late final _$taskCompletedListAtom =
      Atom(name: '_AppStore.taskCompletedList', context: context);

  @override
  ObservableList<TaskModel> get taskCompletedList {
    _$taskCompletedListAtom.reportRead();
    return super.taskCompletedList;
  }

  @override
  set taskCompletedList(ObservableList<TaskModel> value) {
    _$taskCompletedListAtom.reportWrite(value, super.taskCompletedList, () {
      super.taskCompletedList = value;
    });
  }

  late final _$getAllTasksAsyncAction =
      AsyncAction('_AppStore.getAllTasks', context: context);

  @override
  Future<void> getAllTasks() {
    return _$getAllTasksAsyncAction.run(() => super.getAllTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_AppStore.addTask', context: context);

  @override
  Future<void> addTask(TaskModel task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  late final _$updateTaskAsyncAction =
      AsyncAction('_AppStore.updateTask', context: context);

  @override
  Future<void> updateTask(TaskModel task) {
    return _$updateTaskAsyncAction.run(() => super.updateTask(task));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_AppStore.deleteTask', context: context);

  @override
  Future<void> deleteTask(int isFirstState, int taskId) {
    return _$deleteTaskAsyncAction
        .run(() => super.deleteTask(isFirstState, taskId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
taskInProgressList: ${taskInProgressList},
taskCompletedList: ${taskCompletedList}
    ''';
  }
}
