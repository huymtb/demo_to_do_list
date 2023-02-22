// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskModel on _TaskModel, Store {
  late final _$idAtom = Atom(name: '_TaskModel.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$titleAtom = Atom(name: '_TaskModel.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_TaskModel.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$createdDateAtom =
      Atom(name: '_TaskModel.createdDate', context: context);

  @override
  DateTime? get createdDate {
    _$createdDateAtom.reportRead();
    return super.createdDate;
  }

  @override
  set createdDate(DateTime? value) {
    _$createdDateAtom.reportWrite(value, super.createdDate, () {
      super.createdDate = value;
    });
  }

  late final _$updatedDateAtom =
      Atom(name: '_TaskModel.updatedDate', context: context);

  @override
  DateTime? get updatedDate {
    _$updatedDateAtom.reportRead();
    return super.updatedDate;
  }

  @override
  set updatedDate(DateTime? value) {
    _$updatedDateAtom.reportWrite(value, super.updatedDate, () {
      super.updatedDate = value;
    });
  }

  late final _$dueDateAtom = Atom(name: '_TaskModel.dueDate', context: context);

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

  late final _$priorityAtom =
      Atom(name: '_TaskModel.priority', context: context);

  @override
  int? get priority {
    _$priorityAtom.reportRead();
    return super.priority;
  }

  @override
  set priority(int? value) {
    _$priorityAtom.reportWrite(value, super.priority, () {
      super.priority = value;
    });
  }

  late final _$completedAtom =
      Atom(name: '_TaskModel.completed', context: context);

  @override
  int? get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(int? value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description},
createdDate: ${createdDate},
updatedDate: ${updatedDate},
dueDate: ${dueDate},
priority: ${priority},
completed: ${completed}
    ''';
  }
}
