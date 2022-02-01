import 'package:get/get.dart';

import '../Controllers/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
