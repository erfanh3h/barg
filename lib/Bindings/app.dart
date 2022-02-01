import 'package:get/get.dart';

import '../Controllers/app.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
