import 'package:flutter/material.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/pages/home_page/widgets/task_item.dart';

class ListTasksCompleted extends StatelessWidget {
  final List<TaskModel> listTask;
  final Function? onTaskPressed;
  final Function? onTaskPriorityPressed;
  final Function? onTaskCompletedPressed;

  const ListTasksCompleted({
    Key? key,
    required this.listTask,
    this.onTaskCompletedPressed,
    this.onTaskPressed,
    this.onTaskPriorityPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          S.of(context).completed,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        children: listTask.map(_buildListItem).toList(),
      ),
    );
  }

  Widget _buildListItem(TaskModel task) {
    return Builder(builder: (context) {
      return TaskItem(
        task: task,
        onTaskPressed: onTaskPressed,
        onTaskCompletedPressed: onTaskCompletedPressed,
        onTaskPriorityPressed: onTaskPriorityPressed,
      );
    });
  }
}
