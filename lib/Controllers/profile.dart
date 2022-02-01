import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Data/fake_users.dart';
import '../Models/user.dart';

class ProfileController extends GetxController with StateMixin<UserModel> {
  @override
  void onReady() async {
    super.onReady();
    try {
      change(null, status: RxStatus.loading());
      final user = await fetch();
      change(user, status: RxStatus.success());
    } catch (err) {
      Get.back();
      Get.defaultDialog(
        title: 'Error',
        content: const Text('User not found!'),
        confirm:
            IconButton(onPressed: () => Get.back(), icon: const Text('Ok')),
      );
    }
  }

  Future<UserModel> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    String targetId = Get.arguments;
    var datas = json.decode(fakeUsersJson);
    final UserModel user = UserModel.fromJson(
        (datas.firstWhere((user) => user['guid'] == targetId)));
    return user;
  }
}
