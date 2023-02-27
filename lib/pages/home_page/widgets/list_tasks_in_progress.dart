import 'package:flutter/material.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/pages/home_page/widgets/task_item.dart';
import 'package:todo/utils/app_constants.dart';

class ListTaskInProgress extends StatelessWidget {
  final List<TaskModel> listTask;
  final Function? onTaskPressed;
  final Function? onTaskPriorityPressed;
  final Function? onTaskCompletedPressed;

  const ListTaskInProgress({
    Key? key,
    required this.listTask,
    this.onTaskCompletedPressed,
    this.onTaskPressed,
    this.onTaskPriorityPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listTask.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TaskItem(
          key: ValueKey('${AppConstants.taskKey}$index'),
          task: listTask[index],
          onTaskPressed: onTaskPressed,
          onTaskCompletedPressed: onTaskCompletedPressed,
          onTaskPriorityPressed: onTaskPriorityPressed,
        );
      },
    );
  }
}
