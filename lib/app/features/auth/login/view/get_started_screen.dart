import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:divya_path/app/features/dashboard/view/dashboard_screen.dart';

import '../../../../../utils/app_images.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4e5cf),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: .08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.self_improvement,
                size: 42,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Your Spiritual Journey\n",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff202124),
                      height: 1.2,
                    ),
                  ),
                  TextSpan(
                    text: "Starts Here",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              "Discover temples, chants, sacred knowledge,\nAI guidance and daily devotion in one place.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    icon: Icons.local_fire_department_outlined,
                    title: "Daily\nPractice",
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    icon: Icons.menu_book_outlined,
                    title: "Sacred\nKnowledge",
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    icon: Icons.music_note_outlined,
                    title: "Divine\nAudios",
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: FeatureCard(
                    icon: Icons.favorite_border,
                    title: "Inner\nGrowth",
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
            Image.asset(
              height: 300,
              width: double.infinity,
              AppImages.onboardingBgImage,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Get.off(() => const DashboardScreen());
                },
                child: const Text(
                  "Begin Your Journey",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .55),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.orange.withValues(alpha: .15),
        ),
      ),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.orange,
              size: 24,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
