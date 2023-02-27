import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_store.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/pages/home_page/widgets/add_task_button.dart';
import 'package:todo/pages/home_page/widgets/list_tasks_completed.dart';
import 'package:todo/pages/home_page/widgets/list_tasks_in_progress.dart';
import 'package:todo/pages/home_page/widgets/sort_item.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/ui_utils.dart';
import 'package:todo/widgets/app_bar_custom.dart';
import 'package:todo/widgets/complete_icon_button.dart';
import 'package:todo/widgets/icon_button_custom.dart';
import 'package:todo/widgets/loading_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppStore _appStore;

  @override
  void initState() {
    super.initState();
    _appStore = context.read<AppStore>();
    _appStore.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarCustom(
          isShowLeadingWidget: false,
          actionWidget: [
            IconButtonCustom(
              icon: Icons.more_horiz_sharp,
              onPressed: () {
                showMoreBottomSheet(context);
              },
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: AppDimens.defaultPadding,
                      right: AppDimens.defaultPadding,
                      bottom: AppDimens.defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).totalTask(
                            '${_appStore.taskInProgressList.length + _appStore.taskCompletedList.length}'),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        S.of(context).completedTask(
                            '${_appStore.taskCompletedList.length}'),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      if (_appStore.taskInProgressList.isEmpty &&
                          !_appStore.isLoading)
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            S.of(context).emptyListProgress,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      else
                        ListTaskInProgress(
                          listTask: _appStore.taskInProgressList,
                          onTaskPressed: (task) {
                            push(path: RoutePath.taskDetail, object: task);
                          },
                          onTaskPriorityPressed: (task) {
                            updatePriorityTask(task);
                          },
                          onTaskCompletedPressed: (task) {
                            updateCompletedTask(task);
                          },
                        ),
                      if (_appStore.taskCompletedList.isNotEmpty &&
                          !_appStore.hideCompleted) ...[
                        SizedBox(height: AppDimens.defaultPadding),
                        ListTasksCompleted(
                          listTask: _appStore.taskCompletedList,
                          onTaskPressed: (task) {
                            push(path: RoutePath.taskDetail, object: task);
                          },
                          onTaskPriorityPressed: (task) {
                            updatePriorityTask(task);
                          },
                          onTaskCompletedPressed: (task) {
                            updateCompletedTask(task);
                          },
                        )
                      ]
                    ],
                  ),
                ),
                const AddTaskButton()
              ],
            ),
            if (_appStore.isLoading) const LoadingContainer(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }

  Future<void> updateCompletedTask(TaskModel task) async {
    final TaskModel newTask = task;
    newTask.completed = task.completed == 0 ? 1 : 0;
    newTask.updatedDate = DateTime.now();
    await _appStore.updateTask(newTask);
  }

  Future<void> updatePriorityTask(TaskModel task) async {
    final TaskModel newTask = task;
    newTask.priority = task.priority == 0 ? 1 : 0;
    newTask.updatedDate = DateTime.now();
    await _appStore.updateTask(newTask);
  }

  void showMoreBottomSheet(BuildContext context) {
    showBottomSheetCustom(
        context,
        Material(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.all(AppDimens.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  S.of(context).sortBy,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: AppDimens.d_10),
                Observer(builder: (context) {
                  return SortItem(
                    onPressed: () {
                      _appStore
                          .sortTheListInProgress(_appStore.sortBy != 1 ? 1 : 0);
                    },
                    title: S.of(context).name,
                    isSelected: _appStore.sortBy == 1,
                  );
                }),
                SizedBox(height: AppDimens.d_10),
                Observer(builder: (context) {
                  return SortItem(
                    onPressed: () {
                      _appStore
                          .sortTheListInProgress(_appStore.sortBy != 2 ? 2 : 0);
                    },
                    title: S.of(context).priority,
                    isSelected: _appStore.sortBy == 2,
                  );
                }),
                SizedBox(height: AppDimens.d_30),
                GestureDetector(
                  onTap: () {
                    _appStore.toggleHideCompleted();
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).hideCompleted,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Observer(builder: (context) {
                        return CompleteIconButton(
                          completed: _appStore.hideCompleted,
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
