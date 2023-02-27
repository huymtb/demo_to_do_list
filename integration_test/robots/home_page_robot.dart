import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/assets/images/images.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/pages/home_page/home_page.dart';
import 'package:todo/pages/home_page/widgets/add_task_button.dart';
import 'package:todo/pages/home_page/widgets/list_tasks_completed.dart';
import 'package:todo/pages/home_page/widgets/list_tasks_in_progress.dart';
import 'package:todo/pages/task_detail/task_detail_page.dart';
import 'package:todo/utils/app_constants.dart';

class HomePageRobot {
  final WidgetTester tester;

  HomePageRobot(this.tester);

  Future<void> executeTests() async {
    verifyAppBar();
    await verifyBlankHomePage();
    await openTaskDetailPage();
  }

  Future<void> executeTestsAfterAddTasks() async {
    await verifyListHomePage();
    await verifyItemInListTask();
  }

  void verifyAppBar() {
    expect(find.image(const AssetImage(Images.icApp)), findsOneWidget);
  }

  Future<void> verifyBlankHomePage() async {
    final BuildContext context = tester.firstElement(find.byType(HomePage));

    // first launch, app show empty info
    expect(find.text(S.of(context).totalTask(0)), findsOneWidget);
    expect(find.text(S.of(context).completedTask(0)), findsOneWidget);
    expect(find.text(S.of(context).emptyListProgress), findsOneWidget);
    expect(find.byType(ListTaskInProgress), findsNothing);
    expect(find.byType(ListTasksCompleted), findsNothing);
  }

  Future<void> openTaskDetailPage() async {
    final BuildContext context = tester.firstElement(find.byType(HomePage));
    final addButton = find.descendant(
        of: find.byType(AddTaskButton),
        matching: find.text(S.of(context).addNewTask));
    expect(addButton, findsOneWidget);

    // navigate to task detail page
    await tester.tap(addButton);
    await tester.pumpAndSettle();
    expect(find.byType(TaskDetailPage), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> verifyListHomePage() async {
    final BuildContext context = tester.firstElement(find.byType(HomePage));

    expect(find.text(S.of(context).totalTask(1)), findsOneWidget);
    expect(find.text(S.of(context).completedTask(0)), findsOneWidget);
    expect(find.text(S.of(context).emptyListProgress), findsNothing);
    expect(find.byType(ListTaskInProgress), findsOneWidget);
    expect(find.byType(ListTasksCompleted), findsNothing);
  }

  Future<void> verifyItemInListTask() async {
    final Finder firstTaskItem =
        find.byKey(const ValueKey('${AppConstants.taskKey}0'));
    expect(firstTaskItem, findsOneWidget);

    // set current task is completed
    await tester.tap(firstTaskItem);
    await tester.pumpAndSettle();
    expect(find.byType(TaskDetailPage), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> verifyNewListHomePage() async {
    final BuildContext context = tester.firstElement(find.byType(HomePage));

    expect(find.text(S.of(context).totalTask(2)), findsOneWidget);
    expect(find.text(S.of(context).completedTask(0)), findsOneWidget);
    expect(find.text(S.of(context).emptyListProgress), findsNothing);
    expect(find.byType(ListTaskInProgress), findsOneWidget);
    expect(find.byType(ListTasksCompleted), findsNothing);

    final Finder firstTaskItem =
        find.byKey(const ValueKey('${AppConstants.taskKey}0'));
    expect(firstTaskItem, findsOneWidget);

    // set current task is completed
    await tester.tap(firstTaskItem);
    await tester.pumpAndSettle();
    expect(find.byType(TaskDetailPage), findsOneWidget);
    await tester.pumpAndSettle();
  }

  Future<void> verifyCompletedListTask() async {
    final BuildContext context = tester.firstElement(find.byType(HomePage));

    expect(find.text(S.of(context).totalTask(2)), findsOneWidget);
    expect(find.text(S.of(context).completedTask(1)), findsOneWidget);
    expect(find.text(S.of(context).emptyListProgress), findsNothing);
    expect(find.byType(ListTaskInProgress), findsOneWidget);
    expect(find.byType(ListTasksCompleted), findsOneWidget);
  }
}
