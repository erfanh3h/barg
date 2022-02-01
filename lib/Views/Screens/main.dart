import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/main.dart';
import '../Widgets/global_appbar.dart';
import '../Widgets/main_row_card.dart';
import '../Widgets/shimmer_main_row.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar().build(context),
      body: Center(
        child: controller.obx(
          (users) => ListView.separated(
            itemBuilder: (ctx, ind) => MainRowCard(user: users![ind]),
            separatorBuilder: (ctx, ind) => const SizedBox(height: 15),
            itemCount: users!.length,
            padding: const EdgeInsets.all(20),
          ),
          onLoading: ListView.separated(
            itemBuilder: (ctx, ind) => const ShimmerMainRowCard(),
            separatorBuilder: (ctx, ind) => const SizedBox(height: 15),
            itemCount: 5,
            padding: const EdgeInsets.all(20),
          ),
          onEmpty: const Text('No data found'),
          onError: (error) => Text(error!),
        ),
      ),
    );
  }
}
