import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMainRowCard extends StatelessWidget {
  const ShimmerMainRowCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Card(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 15,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 60,
                          height: 15,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 300,
                height: 15,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
