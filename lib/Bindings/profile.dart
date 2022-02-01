import 'package:get/get.dart';

import '../Controllers/profile.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), tag: Get.arguments);
  }
}
