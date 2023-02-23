import 'package:mobx/mobx.dart';
import 'package:todo/utils/app_constants.dart';

part 'task_model.g.dart';

class TaskModel = _TaskModel with _$TaskModel;

abstract class _TaskModel with Store {
  @observable
  int? id;
  @observable
  String? title;
  @observable
  String? description;
  @observable
  DateTime? createdDate;
  @observable
  DateTime? updatedDate;
  @observable
  DateTime? dueDate;
  @observable
  int? priority; // 0: true, 1: false
  @observable
  int? completed; // 0: true, 1: false

  _TaskModel({
    this.id,
    this.title,
    this.description,
    this.createdDate,
    this.priority,
    this.completed,
    this.updatedDate,
    this.dueDate,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      AppConstants.columnTitle: title,
      AppConstants.columnDescription: description,
      AppConstants.columnCreatedTime: createdDate?.toIso8601String(),
      AppConstants.columnUpdatedTime: updatedDate?.toIso8601String(),
      AppConstants.columnDueDate: dueDate?.toIso8601String(),
      AppConstants.columnPriority: priority,
      AppConstants.columnCompleted: completed,
    };
    if (id != null) {
      map[AppConstants.columnId] = id;
    }
    return map;
  }

  _TaskModel.fromMap(Map<String, dynamic> map) {
    id = map[AppConstants.columnId] as int;
    title = map[AppConstants.columnTitle] as String;
    description = map[AppConstants.columnDescription] as String;
    createdDate = DateTime.parse(map[AppConstants.columnCreatedTime] as String);
    updatedDate = DateTime.parse(map[AppConstants.columnUpdatedTime] as String);
    dueDate = map[AppConstants.columnDueDate] != null
        ? DateTime.parse(map[AppConstants.columnDueDate] as String)
        : null;
    priority = map[AppConstants.columnPriority] as int;
    completed = map[AppConstants.columnCompleted] as int;
  }
}
