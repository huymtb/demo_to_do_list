import 'package:flutter/material.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/theme/app_colors.dart';

class AppConstants {
  // database
  static const String dbName = 'to_do_list_db';
  static const String dbTodoTable = 'to_do_table';
  static const int dbVersion = 1;
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';
  static const String columnCreatedTime = 'createdDate';
  static const String columnUpdatedTime = 'updatedDate';
  static const String columnDueDate = 'dueDate';
  static const String columnPriority = 'isPriority';
  static const String columnCompleted = 'isCompleted';

  // duration (milliSecond)
  static const int splashDuration = 2000;

  // key
  static const String inputTitleKey = 'inputTitleKey';
  static const String inputDescriptionKey = 'inputDescriptionKey';
  static const String taskKey = 'taskKey';
  static const String completeButtonKey = 'completedButtonKey';

  // define list of priority level
  List<Map> listPriority = [
    {
      'value': 0,
      'title': S.current.highPriority,
      'icon': const Icon(
        Icons.flag,
        color: AppColors.redText,
      )
    },
    {
      'value': 1,
      'title': S.current.mediumPriority,
      'icon': const Icon(
        Icons.flag,
        color: AppColors.orange,
      )
    },
    {
      'value': 2,
      'title': S.current.lowPriority,
      'icon': const Icon(
        Icons.flag,
        color: AppColors.blue,
      )
    },
  ]; // 0: high, 1: medium, 2: low, 3: do not set priority

  Map defaultPriority = {
    'value': 3,
    'title': S.current.addPriority,
    'icon': const Icon(
      Icons.flag_outlined,
      color: AppColors.grayText,
    )
  };
}
