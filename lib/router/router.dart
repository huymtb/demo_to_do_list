import 'package:go_router/go_router.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/pages/home_page/home_page.dart';
import 'package:todo/pages/splash/splash_page.dart';
import 'package:todo/pages/task_detail/task_detail_page.dart';

class RoutePath {
  RoutePath._();

  static const String splash = '/splash';
  static const String home = '/home';
  static const String taskDetail = '/taskDetail';
}

final GoRouter router = GoRouter(initialLocation: RoutePath.splash, routes: [
  GoRoute(
      path: RoutePath.splash,
      builder: (context, state) {
        return const SplashPage();
      }),
  GoRoute(
      path: RoutePath.home,
      builder: (context, state) {
        return const HomePage();
      }),
  GoRoute(
      path: RoutePath.taskDetail,
      builder: (context, state) {
        return TaskDetailPage(
          task: state.extra != null ? state.extra as TaskModel : null,
        );
      })
]);

void push({required String path, Object? object}) {
  router.push(path, extra: object);
}

void goBack() {
  router.pop();
}

void replace({required String path, Object? object}) {
  router.pushReplacement(path, extra: object);
}

void replaceAll({required String path, Object? object}) {
  router.go(path, extra: object);
}
