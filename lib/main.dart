import 'Bindings/app.dart';
import 'Routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Barg',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.login,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
    );
  }
}
