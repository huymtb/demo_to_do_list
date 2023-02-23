import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_store.dart';
import 'package:todo/assets/images/images.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/router/router.dart';
import 'package:todo/stores/task_store.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/ui_utils.dart';
import 'package:todo/utils/utils.dart';
import 'package:todo/widgets/app_bar_custom.dart';
import 'package:todo/widgets/icon_button_custom.dart';
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
  late DateTime initDate;
  int isFirstState = 0;

  @override
  void initState() {
    super.initState();
    _appStore = context.read<AppStore>();
    if (widget.task != null) {
      isFirstState = widget.task?.completed ?? 1;
      _titleController.text = widget.task?.title ?? '';
      _descriptionController.text = widget.task?.description ?? '';
    } else {
      initDate = DateTime.now();
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
              btnTitle: S.of(context).done,
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
                        onTap: () {},
                        child: SvgPicture.asset(_taskStore.completed
                            ? Images.icCheckedCircle
                            : Images.icCircleOutline),
                      ),
                      SizedBox(width: AppDimens.defaultPadding)
                    ],
                    Expanded(
                      child: TextFieldCustom(
                        controller: _titleController,
                        hintText: S.of(context).inputTitle,
                        onChanged: (value) {
                          _taskStore.enableButton(value);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.smallPadding),
                TextFieldCustom(
                  controller: _descriptionController,
                  hintText: S.of(context).inputDescription,
                  maxLines: 3,
                ),
                SizedBox(height: AppDimens.defaultPadding),
                const Divider(),
                IconButtonCustom(
                  onPressed: () {
                    _taskStore.togglePriority();
                  },
                  iconPath: Icons.star_rounded,
                  btnTitle: _taskStore.priority
                      ? S.of(context).added_priority
                      : S.of(context).add_priority,
                  enable: _taskStore.priority,
                ),
                const Divider(),
                IconButtonCustom(
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
                          S.of(context).createdAt(
                              convertTimeToString(widget.task!.createdDate!)),
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            _appStore.deleteTask(
                                isFirstState, widget.task!.id!);
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
}
