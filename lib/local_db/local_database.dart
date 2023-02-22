import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/utils/app_constants.dart';

class LocalDatabase {
  LocalDatabase._();

  static final LocalDatabase db = LocalDatabase._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        AppConstants.dbName,
      ),
      onCreate: _onCreate,
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: AppConstants.dbVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.
    // Create recent search table
    await db.execute('''
      CREATE TABLE ${AppConstants.dbTodoTable} (
      ${AppConstants.columnId} integer primary key autoincrement,
      ${AppConstants.columnTitle} text,
      ${AppConstants.columnDescription} text,
      ${AppConstants.columnCreatedTime} text,
      ${AppConstants.columnUpdatedTime} text,
      ${AppConstants.columnDueDate} text,
      ${AppConstants.columnPriority} integer,
      ${AppConstants.columnCompleted} integer)',
    ''');
  }

  Future<void> insertTask(TaskModel task) async {
    final db = await database;
    await db?.insert(AppConstants.dbTodoTable, task.toMap());
  }

  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    var tasks = await db?.query(AppConstants.dbTodoTable, columns: [
      AppConstants.columnId,
      AppConstants.columnTitle,
      AppConstants.columnDescription,
      AppConstants.columnCreatedTime,
      AppConstants.columnUpdatedTime,
      AppConstants.columnDueDate,
      AppConstants.columnPriority,
      AppConstants.columnCompleted
    ]);
    List<TaskModel> tasksList = [];
    tasks?.forEach((currentTask) {
      TaskModel task = TaskModel.fromMap(currentTask);
      tasksList.add(task);
    });
    return tasksList;
  }

  Future<TaskModel?> getTask(int id) async {
    final db = await database;
    var tasks = await db?.query(AppConstants.dbTodoTable,
        columns: [
          AppConstants.columnId,
          AppConstants.columnTitle,
          AppConstants.columnDescription,
          AppConstants.columnCreatedTime,
          AppConstants.columnUpdatedTime,
          AppConstants.columnDueDate,
          AppConstants.columnPriority,
          AppConstants.columnCompleted
        ],
        where: '${AppConstants.columnId} = ?',
        whereArgs: [id]);
    if (tasks?.isNotEmpty ?? false) {
      return TaskModel.fromMap(tasks!.first);
    }
    return null;
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db
        ?.delete(AppConstants.dbTodoTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(TaskModel updatedTask) async {
    final db = await database;
    await db?.update(AppConstants.dbTodoTable, updatedTask.toMap(),
        where: 'id = ?', whereArgs: [updatedTask.id]);
  }
}
