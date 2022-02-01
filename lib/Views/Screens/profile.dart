import 'package:barg/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/profile.dart';
import '../Widgets/global_appbar.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  String? get tag => Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar().build(context),
      body: Center(
        child: controller.obx(
          (user) => ListView(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: Colors.pink[100]!,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance: ${user!.balance}',
                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'age: ${user.age}',
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'registered: ${user.registered}',
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'about: ${user.about}',
                            maxLines: 2,
                          ),
                        ),
                        user.isOwner
                            ? Container(
                                margin: const EdgeInsets.only(left: 5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              user.friends.isNotEmpty
                  ? ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 20, bottom: 10, left: 20),
                          child: Text(
                            'friends:',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (ctx, ind) => Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.profile,
                                    arguments: user.friends[ind].guid,
                                    preventDuplicates: false,
                                  );
                                },
                                child: Text(
                                  user.friends[ind].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            itemCount: user.friends.length,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20, left: 20),
                child: Text(
                  'Greeting',
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  user.greeting,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          onLoading: const CircularProgressIndicator(),
          onEmpty: const Text('No data found'),
          onError: (error) => Text(error!),
        ),
      ),
    );
  }
}
