import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

/// this class use to manage the global state for whole app,
/// such as theme mode (dark/light)
abstract class _AppStore with Store {}
