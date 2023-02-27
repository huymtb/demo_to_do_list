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
}
