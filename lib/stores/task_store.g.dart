// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TaskStore.isLoading', context: context);

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

  late final _$enableDoneButtonAtom =
      Atom(name: '_TaskStore.enableDoneButton', context: context);

  @override
  bool get enableDoneButton {
    _$enableDoneButtonAtom.reportRead();
    return super.enableDoneButton;
  }

  @override
  set enableDoneButton(bool value) {
    _$enableDoneButtonAtom.reportWrite(value, super.enableDoneButton, () {
      super.enableDoneButton = value;
    });
  }

  late final _$priorityAtom =
      Atom(name: '_TaskStore.priority', context: context);

  @override
  Map<dynamic, dynamic>? get priority {
    _$priorityAtom.reportRead();
    return super.priority;
  }

  @override
  set priority(Map<dynamic, dynamic>? value) {
    _$priorityAtom.reportWrite(value, super.priority, () {
      super.priority = value;
    });
  }

  late final _$completedAtom =
      Atom(name: '_TaskStore.completed', context: context);

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$dueDateAtom = Atom(name: '_TaskStore.dueDate', context: context);

  @override
  DateTime? get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(DateTime? value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  late final _$completedDateAtom =
      Atom(name: '_TaskStore.completedDate', context: context);

  @override
  DateTime? get completedDate {
    _$completedDateAtom.reportRead();
    return super.completedDate;
  }

  @override
  set completedDate(DateTime? value) {
    _$completedDateAtom.reportWrite(value, super.completedDate, () {
      super.completedDate = value;
    });
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void enableButton(String title) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.enableButton');
    try {
      return super.enableButton(title);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePriority(Map<dynamic, dynamic> selectedPriority) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.togglePriority');
    try {
      return super.togglePriority(selectedPriority);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCompleted() {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.toggleCompleted');
    try {
      return super.toggleCompleted();
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
enableDoneButton: ${enableDoneButton},
priority: ${priority},
completed: ${completed},
dueDate: ${dueDate},
completedDate: ${completedDate}
    ''';
  }
}
