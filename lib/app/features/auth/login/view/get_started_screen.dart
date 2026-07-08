import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:divya_path/app/features/dashboard/view/dashboard_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Divya Path", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Get.off(() => const DashboardScreen()),
              child: const Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
