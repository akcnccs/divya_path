import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../models/models.dart';
import 'package:divya_path/utils/app_them.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Sanctuary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.settings)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildStatsSection(),
            const SizedBox(height: 32),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(user.avatar),
        ),
        const SizedBox(height: 16),
        Text(user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(user.email, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.secondaryAmber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.secondaryAmber.withOpacity(0.5)),
          ),
          child: Text(
            "${user.membershipType} Member",
            style: const TextStyle(color: AppTheme.secondaryAmber, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem("Streak", "${user.meditationStreak}d", LucideIcons.flame),
        _buildStatItem("Chants", "${user.totalChantsCount}", LucideIcons.sparkles),
        _buildStatItem("Mins", "${user.meditationMinutes}", LucideIcons.clock),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryOrange, size: 24),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(LucideIcons.history, "Donation History"),
        _buildMenuItem(LucideIcons.bookOpen, "My Bookings"),
        _buildMenuItem(LucideIcons.heart, "Favorites"),
        _buildMenuItem(LucideIcons.helpCircle, "Support"),
        _buildMenuItem(LucideIcons.logOut, "Logout", isLast: true),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Icon(LucideIcons.chevronRight, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
