import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/app.dart';
import '../../Routes/routes.dart';

class GlobalAppbar extends GetView<AppController> {
  const GlobalAppbar({
    Key? key,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          InkWell(
            onTap: () => Get.toNamed(
              Routes.profile,
              arguments: controller.userId.value,
              preventDuplicates: false,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: controller.userImage.value.isNotEmpty
                  ? Image.network(
                      controller.userImage.value,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/Images/userplaceholder.png',
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                      height: 40,
                      width: 40,
                    )
                  : Image.asset(
                      'assets/Images/userplaceholder.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                    ),
            ),
          ),
          const SizedBox(width: 20),
          Text(controller.username.value)
        ],
      ),
    );
  }
}
