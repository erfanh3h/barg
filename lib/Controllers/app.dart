import 'package:get/get.dart';

class AppController extends GetxController {
  var userId = ''.obs;
  var username = ''.obs;
  var userImage = ''.obs;
  var userToken = ''.obs;

  setUserDatas(String name, String id) {
    username(name);
    userId(id);
  }
}
