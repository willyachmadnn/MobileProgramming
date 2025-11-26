part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = Paths.HOME;
  static const MEDIA_QUERY = Paths.MEDIA_QUERY;
  static const FLEXIBLE = Paths.FLEXIBLE;
  static const EXPANDED = Paths.EXPANDED;
  static const FITTED_BOX = Paths.FITTED_BOX;
  static const WRAP = Paths.WRAP;
}

abstract class Paths {
  Paths._();
  static const HOME = '/home';
  static const MEDIA_QUERY = '/media-query';
  static const FLEXIBLE = '/flexible';
  static const EXPANDED = '/expanded';
  static const FITTED_BOX = '/fitted-box';
  static const WRAP = '/wrap';
}