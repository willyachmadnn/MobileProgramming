part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ADD_TASK = _Paths.ADD_TASK;
  static const TASK_DETAIL = _Paths.TASK_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ADD_TASK = '/add-task';
  static const TASK_DETAIL = '/task-detail';
}