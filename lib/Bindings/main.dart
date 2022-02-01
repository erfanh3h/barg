import 'package:get/get.dart';

import '../Controllers/main.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
