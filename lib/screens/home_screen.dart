import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons_flutter.dart';
import '../models/models.dart';
import 'package:divya_path/utils/app_them.dart';

class HomeScreen extends StatelessWidget {
  final UserProfile user;
  final PanchangData panchang;

  const HomeScreen({
    super.key, 
    required this.user, 
    required this.panchang,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildSearchBar(context),
              const SizedBox(height: 24),
              _buildStatsGrid(),
              const SizedBox(height: 24),
              _buildPanchangCard(context),
              const SizedBox(height: 24),
              _buildAskKrishna(context),
              const SizedBox(height: 24),
              _buildSpiritualAudios(context),
              const SizedBox(height: 24),
              _buildLiveDarshan(context),
              const SizedBox(height: 24),
              _buildCharityBanner(context),
              const SizedBox(height: 100), // Bottom padding for navigation
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                children: [
                  const TextSpan(text: "Namaste, "),
                  TextSpan(
                    text: user.name,
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
              backgroundImage: NetworkImage(user.avatar),
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
                child: Icon(LucideIcons.award, size: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.1)),
      ),
      child: const Row(
        children: [
          Icon(LucideIcons.search, color: AppTheme.primaryOrange, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Search temples, deities, bhajans...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            LucideIcons.flame,
            "Japa Streak",
            "${user.meditationStreak}",
            "Days",
            "Chant daily!",
            const Color(0xFFF57C00),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            LucideIcons.compass,
            "Mindfulness",
            "${user.meditationMinutes}",
            "Mins",
            "Stillness attained.",
            const Color(0xFFFFB300),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value, String unit, String sub, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildPanchangCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Theme.of(context).brightness == Brightness.dark
              ? [const Color(0xFF1E222D), const Color(0xFF121419)]
              : [const Color(0xFFFFFDF9), const Color(0xFFFFF6EB)],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
            Icon(LucideIcons.calendarDays, color: AppTheme.primaryOrange, size: 18),
              const SizedBox(width: 8),
              Text(
                "TODAY'S SACRED PANCHANG",
                style: TextStyle(
                  color: AppTheme.primaryOrange,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            panchang.tithi,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            panchang.tithiMeaning,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPanchangItem("Constellation", panchang.nakshatra),
              _buildPanchangItem("Moon Phase", panchang.moonPhase),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPanchangItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, color: Colors.grey)),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildAskKrishna(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://images.unsplash.com/photo-1590076214561-20573908db48?q=80&w=300&auto=format&fit=crop",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\"Perform your duty with a calm mind...\"",
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8),
                Text(
                  "ASK KRISHNA",
                  style: TextStyle(color: AppTheme.primaryOrange, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpiritualAudios(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Spiritual Audios", style: TextStyle(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text("View All")),
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: NetworkImage("https://images.unsplash.com/photo-1518241353330-0f7941c2d9b5?q=80&w=400"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text("Shiva Tandava", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1),
                    const Text("Traditional", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLiveDarshan(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage("https://images.unsplash.com/photo-1626645607073-7e289bf67246?q=80&w=800"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
          const Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Colors.red, radius: 4),
                SizedBox(width: 4),
                Text("LIVE", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kedarnath Shrine", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("Virtual Morning Abhishekam", style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharityBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.1)),
      ),
      child: const Row(
        children: [
          Icon(LucideIcons.gift, color: AppTheme.primaryOrange),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Feed Sacred Cows", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text("Sponsor fodder at Ram Mandir Gaushala", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Icon(LucideIcons.chevronRight, color: AppTheme.primaryOrange),
        ],
      ),
    );
  }
}
