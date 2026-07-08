import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../utils/app_them.dart';

class HomeAppBarWidget extends StatelessWidget {
  final String name;
  final String image;
  const HomeAppBarWidget({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SHUBH PRABHAT • BLESSED MORNING",
              style: TextStyle(
                color: AppTheme.primaryOrange,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(text: "Namaste, "),
                  TextSpan(
                    text: name,
                    style: const TextStyle(color: AppTheme.primaryOrange),
                  ),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(image),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryOrange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.award,
                    size: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
