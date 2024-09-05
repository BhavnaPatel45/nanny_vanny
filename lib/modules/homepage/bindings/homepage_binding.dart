import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
