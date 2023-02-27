import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_store.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/router/router.dart';
import 'package:todo/stores/task_store.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/app_constants.dart';
import 'package:todo/utils/ui_utils.dart';
import 'package:todo/utils/utils.dart';
import 'package:todo/widgets/app_bar_custom.dart';
import 'package:todo/widgets/complete_icon_button.dart';
import 'package:todo/widgets/dialog_custom.dart';
import 'package:todo/widgets/icon_button_text_custom.dart';
import 'package:todo/widgets/text_button_custom.dart';
import 'package:todo/widgets/text_field_custom.dart';

class TaskDetailPage extends StatefulWidget {
  final TaskModel? task;

  const TaskDetailPage({Key? key, this.task}) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  late AppStore _appStore;
  final TaskStore _taskStore = TaskStore();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int isFirstState = 0;

  @override
  void initState() {
    super.initState();
    _appStore = context.read<AppStore>();
    if (widget.task != null) {
      initTask();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCustom(
          actionWidget: [
            TextButtonCustom(
              onPressed: () {
                onSavePressed();
                goBack();
              },
              btnTitle: S.of(context).save,
              enable: _taskStore.enableDoneButton,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    if (widget.task != null) ...[
                      GestureDetector(
                        key: const ValueKey(AppConstants.completeButtonKey),
                        onTap: () {
                          _taskStore.completedDate = DateTime.now();
                          _taskStore.toggleCompleted();
                        },
                        child: CompleteIconButton(
                          completed: _taskStore.completed,
                        ),
                      ),
                      SizedBox(width: AppDimens.defaultPadding)
                    ],
                    Expanded(
                      child: TextFieldCustom(
                        key: const ValueKey(AppConstants.inputTitleKey),
                        controller: _titleController,
                        hintText: S.of(context).inputTitle,
                        completed: _taskStore.completed,
                        onChanged: (value) {
                          _taskStore.enableButton(value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.smallPadding),
                TextFieldCustom(
                  key: const ValueKey(AppConstants.inputDescriptionKey),
                  controller: _descriptionController,
                  hintText: S.of(context).inputDescription,
                  maxLines: 3,
                ),
                SizedBox(height: AppDimens.defaultPadding),
                const Divider(),
                IconButtonTextCustom(
                  onPressed: () {
                    _taskStore.togglePriority();
                  },
                  iconPath: Icons.star_rounded,
                  btnTitle: _taskStore.priority
                      ? S.of(context).addedPriority
                      : S.of(context).addPriority,
                  enable: _taskStore.priority,
                ),
                const Divider(),
                IconButtonTextCustom(
                  onPressed: () {
                    openCalendar();
                  },
                  iconPath: Icons.calendar_month_sharp,
                  btnTitle: _taskStore.dueDate != null
                      ? convertTimeToString(_taskStore.dueDate!)
                      : S.of(context).addDueDate,
                  enable: _taskStore.dueDate != null,
                  suffixIconPressed: () {
                    _taskStore.dueDate = null;
                  },
                ),
                const Divider(),
                SizedBox(height: AppDimens.defaultPadding),
                if (widget.task?.id != null)
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          _taskStore.completed
                              ? S.of(context).completedAt(convertTimeToString(
                                  _taskStore.completedDate ?? DateTime.now()))
                              : S.of(context).createdAt(convertTimeToString(
                                  widget.task!.createdDate!)),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            showDialogDeleteTask(context);
                          },
                          child: Icon(
                            Icons.delete_outline,
                            size: AppDimens.d_20,
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

  void openCalendar() {
    showBottomSheetCustom(
        context,
        CupertinoDatePicker(
          initialDateTime: _taskStore.dueDate ?? DateTime.now(),
          onDateTimeChanged: (dateTime) {
            _taskStore.dueDate = dateTime;
          },
        ));
  }

  Future<void> onSavePressed() async {
    if (widget.task != null) {
      await _appStore.updateTask(TaskModel(
          id: widget.task?.id,
          title: _titleController.text,
          description: _descriptionController.text,
          dueDate: _taskStore.dueDate,
          priority: _taskStore.priority ? 0 : 1,
          completed: _taskStore.completed ? 0 : 1,
          createdDate:
              widget.task != null ? widget.task?.createdDate : DateTime.now(),
          updatedDate: DateTime.now()));
    } else {
      await _appStore.addTask(TaskModel(
          title: _titleController.text,
          description: _descriptionController.text,
          dueDate: _taskStore.dueDate,
          priority: _taskStore.priority ? 0 : 1,
          completed: _taskStore.completed ? 0 : 1,
          createdDate:
              widget.task != null ? widget.task?.createdDate : DateTime.now(),
          updatedDate: DateTime.now()));
    }
  }

  void showDialogDeleteTask(BuildContext context) {
    showDialogCustom(
        context,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).sureDeleteTask,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: AppDimens.d_14),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonCustom(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  btnTitle: S.of(context).no,
                  enable: true,
                ),
                SizedBox(width: AppDimens.defaultPadding),
                TextButtonCustom(
                  onPressed: () {
                    _appStore.deleteTask(isFirstState, widget.task!.id!);
                    Navigator.of(context).pop();
                    goBack();
                  },
                  btnTitle: S.of(context).yes,
                  enable: true,
                ),
              ],
            )
          ],
        ));
  }

  void initTask() {
    isFirstState = widget.task?.completed ?? 1;
    _titleController.text = widget.task?.title ?? '';
    _descriptionController.text = widget.task?.description ?? '';
    _taskStore.dueDate = widget.task?.dueDate;
    _taskStore.priority = widget.task?.priority == 0;
    _taskStore.completed = widget.task?.completed == 0;
    if (_taskStore.completed) {
      _taskStore.completedDate = widget.task?.updatedDate;
    }
    _taskStore.enableButton(_titleController.text);
  }
}
