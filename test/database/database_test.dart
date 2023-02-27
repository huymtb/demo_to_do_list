import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/utils/app_constants.dart';

Future main() async {
  // Setup sqflite_common_ffi for flutter test
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  });

  test('Local DB Test', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE ${AppConstants.dbTodoTable} (
      ${AppConstants.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AppConstants.columnTitle} TEXT,
      ${AppConstants.columnDescription} TEXT,
      ${AppConstants.columnCreatedTime} TEXT,
      ${AppConstants.columnUpdatedTime} TEXT,
      ${AppConstants.columnDueDate} TEXT,
      ${AppConstants.columnPriority} INTEGER,
      ${AppConstants.columnCompleted} INTEGER)
    ''');
    });
    // Insert some data
    await db.insert(AppConstants.dbTodoTable, {
      AppConstants.columnTitle: 'Task 1',
      AppConstants.columnDescription: 'Description Task 1',
      AppConstants.columnCreatedTime: '2023-02-25T11:33:54',
      AppConstants.columnUpdatedTime: '2023-02-25T11:33:54',
      AppConstants.columnDueDate: '2023-02-28T11:33:54',
      AppConstants.columnPriority: 0,
      AppConstants.columnCompleted: 1,
    });
    await db.insert(AppConstants.dbTodoTable, {
      AppConstants.columnTitle: 'Task 2',
      AppConstants.columnDescription: 'Description Task 1',
      AppConstants.columnCreatedTime: '2023-02-25T11:33:54',
      AppConstants.columnUpdatedTime: '2023-02-26T11:33:54',
      AppConstants.columnDueDate: '2023-02-28T11:33:54',
      AppConstants.columnPriority: 1,
      AppConstants.columnCompleted: 0,
    });

    // query all
    final data = await db.query(AppConstants.dbTodoTable);

    expect(data.length, 2);
    expect(data, [
      {
        AppConstants.columnId: 1,
        AppConstants.columnTitle: 'Task 1',
        AppConstants.columnDescription: 'Description Task 1',
        AppConstants.columnCreatedTime: '2023-02-25T11:33:54',
        AppConstants.columnUpdatedTime: '2023-02-25T11:33:54',
        AppConstants.columnDueDate: '2023-02-28T11:33:54',
        AppConstants.columnPriority: 0,
        AppConstants.columnCompleted: 1,
      },
      {
        AppConstants.columnId: 2,
        AppConstants.columnTitle: 'Task 2',
        AppConstants.columnDescription: 'Description Task 1',
        AppConstants.columnCreatedTime: '2023-02-25T11:33:54',
        AppConstants.columnUpdatedTime: '2023-02-26T11:33:54',
        AppConstants.columnDueDate: '2023-02-28T11:33:54',
        AppConstants.columnPriority: 1,
        AppConstants.columnCompleted: 0,
      }
    ]);
    expect(data.first[AppConstants.columnId], 1);
    expect(data.last[AppConstants.columnId], 2);

    // query by Id
    final taskData = await db.query(AppConstants.dbTodoTable,
        where: '${AppConstants.columnId} = ?', whereArgs: [1]);
    expect(taskData.length, 1);

    final TaskModel task = TaskModel.fromMap(taskData.first);
    expect(task.id, 1);

    // get task in-progress
    final taskInProgressData = await db.query(AppConstants.dbTodoTable,
        where: '${AppConstants.columnCompleted} = ?', whereArgs: [1]);
    expect(taskInProgressData.length, 1);
    final TaskModel taskInProgress =
        TaskModel.fromMap(taskInProgressData.first);
    expect(taskInProgress.id, 1);
    expect(taskInProgress.completed, 1);

    // get task completed
    final taskCompletedData = await db.query(AppConstants.dbTodoTable,
        where: '${AppConstants.columnCompleted} = ?', whereArgs: [0]);
    expect(taskInProgressData.length, 1);
    final TaskModel taskCompleted = TaskModel.fromMap(taskCompletedData.first);
    expect(taskCompleted.id, 2);
    expect(taskCompleted.completed, 0);

    // update task
    var taskNeedUpdatedData = data.first;
    TaskModel taskNeedUpdate = TaskModel.fromMap(taskNeedUpdatedData);
    expect(taskNeedUpdate.priority, 0);

    // update priority to 1
    taskNeedUpdate.priority = 1;
    await db.update(AppConstants.dbTodoTable, taskNeedUpdate.toMap(),
        where: 'id = ?', whereArgs: [taskNeedUpdate.id]);

    final taskUpdatedData = await db.query(AppConstants.dbTodoTable,
        where: '${AppConstants.columnId} = ?', whereArgs: [1]);
    expect(taskUpdatedData, [
      {
        AppConstants.columnId: 1,
        AppConstants.columnTitle: 'Task 1',
        AppConstants.columnDescription: 'Description Task 1',
        AppConstants.columnCreatedTime: '2023-02-25T11:33:54.000',
        AppConstants.columnUpdatedTime: '2023-02-25T11:33:54.000',
        AppConstants.columnDueDate: '2023-02-28T11:33:54.000',
        AppConstants.columnPriority: 1,
        AppConstants.columnCompleted: 1,
      }
    ]);

    // delete task id = 1
    await db.delete(AppConstants.dbTodoTable, where: 'id = ?', whereArgs: [1]);
    final dataAfterDeleted = await db.query(AppConstants.dbTodoTable);
    expect(dataAfterDeleted.length, 1);
    expect(dataAfterDeleted, [
      {
        AppConstants.columnId: 2,
        AppConstants.columnTitle: 'Task 2',
        AppConstants.columnDescription: 'Description Task 1',
        AppConstants.columnCreatedTime: '2023-02-25T11:33:54',
        AppConstants.columnUpdatedTime: '2023-02-26T11:33:54',
        AppConstants.columnDueDate: '2023-02-28T11:33:54',
        AppConstants.columnPriority: 1,
        AppConstants.columnCompleted: 0,
      }
    ]);

    await db.close();
  });
}
