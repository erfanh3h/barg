import 'dart:convert';

import 'package:get/get.dart';

import '../Data/fake_users.dart';
import '../Models/user.dart';

class MainController extends GetxController with StateMixin<List<UserModel>> {
  @override
  void onReady() async {
    super.onReady();
    try {
      change(null, status: RxStatus.loading());

      final users = await fetch();

      if (users.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(users, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }

  Future<List<UserModel>> fetch() async {
    await Future.delayed(const Duration(seconds: 1));
    List<UserModel> users = [];
    var datas = json.decode(fakeUsersJson);
    datas.forEach((userJson) => users.add(UserModel.fromJson(userJson)));
    return users;
  }
}
