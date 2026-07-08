import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:divya_path/utils/app_them.dart';
import 'package:divya_path/app/features/dashboard/controller/dashboard_controller.dart';
import 'package:divya_path/screens/home_screen.dart';
import 'package:divya_path/screens/temple_screen.dart';
import 'package:divya_path/screens/ai_screen.dart';
import 'package:divya_path/screens/profile_screen.dart';
import 'package:divya_path/models/models.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final user = UserProfile(
      name: "Aditya",
      email: "aditya@sanatan.ai",
      avatar: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200",
      meditationStreak: 12,
      longestStreak: 45,
      totalChantsCount: 10008,
      meditationMinutes: 1240,
      membershipType: "Gold",
    );

    final panchang = PanchangData(
      tithi: "Shukla Paksha Ekadashi",
      tithiMeaning: "The 11th lunar day, highly auspicious for fasting and Vishnu worship.",
      nakshatra: "Rohini",
      nakshatraDeity: "Lord Brahma",
      sunrise: "06:12 AM",
      sunset: "06:45 PM",
      moonPhase: "Waxing Gibbous",
      moonPhaseIcon: "🌔",
      muhurat: [],
      festival: "Vaikuntha Ekadashi",
      rahuKaal: "01:30 PM - 03:00 PM",
      amritKaal: "04:00 AM - 05:30 AM",
    );

    final List<Widget> screens = [
      HomeScreen(user: user, panchang: panchang),
      const TempleScreen(),
      const AiScreen(),
      const Center(child: Text("Library Tab")),
      ProfileScreen(user: user),
    ];

    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: AppTheme.primaryOrange,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.temple_hindu_outlined), activeIcon: Icon(Icons.temple_hindu), label: 'Temples'),
            BottomNavigationBarItem(icon: Icon(Icons.psychology_outlined), activeIcon: Icon(Icons.psychology), label: 'Ask AI'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined), activeIcon: Icon(Icons.library_music), label: 'Devotional'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
