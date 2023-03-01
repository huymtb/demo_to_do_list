import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/pages/task_detail/task_detail_page.dart';
import 'package:todo/utils/app_constants.dart';
import 'package:todo/widgets/app_bar_custom.dart';
import 'package:todo/widgets/icon_button_text_custom.dart';
import 'package:todo/widgets/text_field_custom.dart';

class TaskDetailPageRobot {
  final WidgetTester tester;

  TaskDetailPageRobot(this.tester);

  Future<void> executeTests() async {
    verifyAppBar();
    await verifyTaskDetailPage();
    await createANewTask();
  }

  Future<void> executeUpdateTaskTest() async {
    await updateATask();
  }

  void verifyAppBar() {
    final BuildContext context =
        tester.firstElement(find.byType(TaskDetailPage));
    final Finder saveButton = find.descendant(
        of: find.byType(AppBarCustom), matching: find.text(S.of(context).save));
    expect(saveButton, findsOneWidget);
  }

  Future<void> verifyTaskDetailPage() async {
    expect(find.byType(TextFieldCustom), findsNWidgets(2));
    expect(find.byType(IconButtonTextCustom), findsNWidgets(2));
  }

  Future<void> createANewTask() async {
    final BuildContext context =
        tester.firstElement(find.byType(TaskDetailPage));

    // save button
    final Finder saveButton = find.descendant(
        of: find.byType(AppBarCustom), matching: find.text(S.of(context).save));
    expect(saveButton, findsOneWidget);

    final Finder tittleInputFinder =
        find.byKey(const ValueKey(AppConstants.inputTitleKey));
    expect(tittleInputFinder, findsOneWidget);

    final Finder descriptionInputFinder =
        find.byKey(const ValueKey(AppConstants.inputDescriptionKey));
    expect(descriptionInputFinder, findsOneWidget);

    // input title and description
    await tester.enterText(tittleInputFinder, 'Task 1 title');
    await tester.pumpAndSettle();

    await tester.enterText(descriptionInputFinder, 'Task 1 description');
    await tester.pumpAndSettle();

    // press save button
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> updateATask() async {
    final BuildContext context =
        tester.firstElement(find.byType(TaskDetailPage));

    final Finder saveButton = find.descendant(
        of: find.byType(AppBarCustom), matching: find.text(S.of(context).save));
    expect(saveButton, findsOneWidget);

    final Finder tittleInputFinder =
        find.byKey(const ValueKey(AppConstants.inputTitleKey));
    expect(tittleInputFinder, findsOneWidget);

    final Finder descriptionInputFinder =
        find.byKey(const ValueKey(AppConstants.inputDescriptionKey));
    expect(descriptionInputFinder, findsOneWidget);

    await tester.enterText(tittleInputFinder, 'Task 1 title update');
    await tester.pumpAndSettle();

    await tester.enterText(descriptionInputFinder, 'Task 1 description update');
    await tester.pumpAndSettle();

    // press save button
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  // set complete task
  Future<void> setTaskComplete() async {
    final BuildContext context =
        tester.firstElement(find.byType(TaskDetailPage));
    final Finder completeButtonFinder =
        find.byKey(const ValueKey(AppConstants.completeButtonKey));
    expect(completeButtonFinder, findsOneWidget);

    await tester.tap(completeButtonFinder);
    await tester.pumpAndSettle();

    final Finder saveButton = find.descendant(
        of: find.byType(AppBarCustom), matching: find.text(S.of(context).save));
    expect(saveButton, findsOneWidget);

    // press save button
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }
}
