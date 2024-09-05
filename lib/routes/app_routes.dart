import 'package:get/get.dart';

import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';


class AppRoutes {
  static const HOME = '/';

  static final routes = [
    GetPage(
      name: HOME,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
