import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/media_query_view.dart';
import '../modules/home/views/flexible_view.dart';
import '../modules/home/views/expanded_view.dart';
import '../modules/home/views/fitted_box_view.dart';
import '../modules/home/views/wrap_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.MEDIA_QUERY,
      page: () => MediaQueryView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.FLEXIBLE,
      page: () => FlexibleView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.EXPANDED,
      page: () => ExpandedView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.FITTED_BOX,
      page: () => FittedBoxView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.WRAP,
      page: () => WrapView(),
      binding: HomeBinding(),
    ),
  ];
}