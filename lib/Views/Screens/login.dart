import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/login.dart';
import '../Widgets/input_box.dart';
import '../Widgets/submit_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: Get.size.height,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      InputBox(
                        label: 'Username',
                        controller: controller.userCtrl,
                        validator: (String value) {
                          if (value.isEmpty) return 'Required';
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      InputBox(
                        label: 'Password',
                        controller: controller.passCtrl,
                        hideContent: true,
                        minLines: 1,
                        maxLines: 1,
                        validator: (String value) {
                          if (value.isEmpty) return 'Required';
                          if (value.length < 8) return 'Atleast 8 characters';
                          return null;
                        },
                      ),
                      const Spacer(),
                      SubmitButton(
                        func: () => controller.login(),
                        title: 'Login',
                        color: Colors.pink[100]!,
                        fontColor: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
