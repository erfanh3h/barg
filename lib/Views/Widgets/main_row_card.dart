import '../../Models/user.dart';
import '../../Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainRowCard extends StatelessWidget {
  const MainRowCard({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.profile,
        arguments: user.guid,
        preventDuplicates: false,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      user.picture,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/Images/userplaceholder.png',
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          user.email,
                          style: const TextStyle(color: Colors.black),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text('Address: ${user.address}')
            ],
          ),
        ),
      ),
    );
  }
}
