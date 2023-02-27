import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo/main.dart' as app;

import 'robots/home_page_robot.dart';
import 'robots/splash_page_robot.dart';
import 'robots/task_detail_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('Test the whole app', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await testSplashPage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await testHomePage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await testTaskDetailPage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await testListHomePage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await testUpdateTaskDetailPage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    // to create new task and then set completing
    await openTaskDetailPage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await testTaskDetailPage(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await verifyNewHomeList(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await setTaskUpdated(tester);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await verifyCompletedHomeList(tester);
  });
}

Future<void> testSplashPage(WidgetTester tester) async {
  SplashPageRobot splashPageRobot = SplashPageRobot(tester);
  await splashPageRobot.executeTests();
}

Future<void> testHomePage(WidgetTester tester) async {
  HomePageRobot homePageRobot = HomePageRobot(tester);
  await homePageRobot.executeTests();
}

Future<void> testListHomePage(WidgetTester tester) async {
  HomePageRobot homePageRobot = HomePageRobot(tester);
  await homePageRobot.executeTestsAfterAddTasks();
}

Future<void> openTaskDetailPage(WidgetTester tester) async {
  HomePageRobot homePageRobot = HomePageRobot(tester);
  await homePageRobot.openTaskDetailPage();
}

Future<void> verifyNewHomeList(WidgetTester tester) async {
  HomePageRobot homePageRobot = HomePageRobot(tester);
  await homePageRobot.verifyNewListHomePage();
}

Future<void> verifyCompletedHomeList(WidgetTester tester) async {
  HomePageRobot homePageRobot = HomePageRobot(tester);
  await homePageRobot.verifyCompletedListTask();
}

Future<void> testTaskDetailPage(WidgetTester tester) async {
  TaskDetailPageRobot taskDetailPageRobot = TaskDetailPageRobot(tester);
  await taskDetailPageRobot.executeTests();
}

Future<void> testUpdateTaskDetailPage(WidgetTester tester) async {
  TaskDetailPageRobot taskDetailPageRobot = TaskDetailPageRobot(tester);
  await taskDetailPageRobot.executeUpdateTaskTest();
}

Future<void> setTaskUpdated(WidgetTester tester) async {
  TaskDetailPageRobot taskDetailPageRobot = TaskDetailPageRobot(tester);
  await taskDetailPageRobot.setTaskComplete();
}
