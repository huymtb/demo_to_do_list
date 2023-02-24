import 'package:flutter/material.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/utils.dart';
import 'package:todo/widgets/complete_icon_button.dart';

class TaskItem extends StatelessWidget {
  final TaskModel? task;
  final Function? onTaskPressed;
  final Function? onTaskPriorityPressed;
  final Function? onTaskCompletedPressed;

  const TaskItem({
    Key? key,
    this.task,
    this.onTaskCompletedPressed,
    this.onTaskPressed,
    this.onTaskPriorityPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTaskPressed?.call(task);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppDimens.defaultPadding, vertical: AppDimens.d_5),
        padding: EdgeInsets.all(AppDimens.smallPadding),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimens.d_10),
            border: Border.all(color: AppColors.primary)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                onTaskCompletedPressed?.call(task);
              },
              child: CompleteIconButton(
                completed: task?.completed == 0,
              ),
            ),
            SizedBox(width: AppDimens.defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        decoration: task?.completed == 0
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  if (task?.dueDate != null && task?.completed != 0) ...[
                    Text(
                      S
                          .of(context)
                          .dueDate(convertTimeToString(task!.dueDate!)),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: compareDate(task!.dueDate!, DateTime.now())
                              ? AppColors.grayText
                              : AppColors.redText),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ] else if (task?.description?.isNotEmpty ?? false) ...[
                    Text(
                      task?.description ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                ],
              ),
            ),
            SizedBox(width: AppDimens.defaultPadding),
            GestureDetector(
              onTap: () {
                onTaskPriorityPressed?.call(task);
              },
              child: Icon(
                task?.priority == 0
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
