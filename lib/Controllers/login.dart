import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Routes/routes.dart';
import 'app.dart';

class LoginController extends GetxController {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>();

  login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading(true);
    final bool loginResult = await fakeLogin(userCtrl.text, passCtrl.text);
    if (loginResult) {
      Get.find<AppController>()
          .setUserDatas(userCtrl.text, '1791c941-9939-4970-be9a-09739587d69b');
      Get.toNamed(Routes.main);
    } else {
      Get.defaultDialog(
        title: 'Error',
        content: const Text('Username or password are incorrect!'),
        confirm:
            IconButton(onPressed: () => Get.back(), icon: const Text('Ok')),
      );
    }
    isLoading(false);
  }

  Future<bool> fakeLogin(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'Koch Hartman' && password == '12345678') {
      return true;
    } else {
      return false;
    }
  }
}
