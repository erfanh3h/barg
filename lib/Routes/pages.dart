import 'package:get/get.dart';

import '../Bindings/login.dart';
import '../Bindings/main.dart';
import '../Bindings/profile.dart';
import '../Views/Screens/login.dart';
import '../Views/Screens/main.dart';
import '../Views/Screens/profile.dart';
import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
