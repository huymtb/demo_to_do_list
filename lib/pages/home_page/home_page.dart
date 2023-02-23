import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_store.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/pages/home_page/widgets/add_task_button.dart';
import 'package:todo/pages/home_page/widgets/list_tasks_in_progress.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/widgets/app_bar_custom.dart';
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
        appBar: const AppBarCustom(
          isShowLeadingWidget: false,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.defaultPadding),
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
                SizedBox(height: AppDimens.defaultPadding),
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
                  )
              ],
            ),
            if (_appStore.isLoading) const LoadingContainer(),
          ],
        ),
        floatingActionButton: const AddTaskButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}
