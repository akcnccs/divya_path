import 'package:flutter/material.dart';
import 'package:divya_path/utils/app_them.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../utils/app_images.dart';

class TempleScreen extends StatelessWidget {
  const TempleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sacred Temples",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTempleCard(
            context,
            "Kedarnath Temple",
            "Uttarakhand, Himalayas",
            "https://images.unsplash.com/photo-1626645607073-7e289bf67246?q=80&w=800",
            true,
          ),
          const SizedBox(height: 20),
          _buildTempleCard(
            context,
            "Kashi Vishwanath",
            "Varanasi, Uttar Pradesh",
            "https://images.unsplash.com/photo-1590076214561-20573908db48?q=80&w=800",
            false,
          ),
          const SizedBox(height: 20),
          _buildTempleCard(
            context,
            "Meenakshi Amman",
            "Madurai, Tamil Nadu",
            "https://images.unsplash.com/photo-1609137144814-72df48666579?q=80&w=800",
            true,
          ),
        ],
      ),
    );
  }

  Widget _buildTempleCard(BuildContext context, String name, String location,
      String imageUrl, bool live) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(AppImages.krishnaImages,
                  height: 180, width: double.infinity, fit: BoxFit.cover),
              if (live)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle, size: 8, color: Colors.white),
                        SizedBox(width: 4),
                        Text("LIVE DARSHAN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(LucideIcons.mapPin, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(location,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppTheme.primaryOrange.withOpacity(0.1),
                          foregroundColor: AppTheme.primaryOrange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Book Pooja"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryOrange,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("View Details"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
