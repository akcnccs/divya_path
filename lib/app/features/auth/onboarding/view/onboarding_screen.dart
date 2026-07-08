import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:divya_path/utils/app_them.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentSlide = 0;
  bool _showAuth = false;

  final List<Map<String, dynamic>> _slides = [
    {
      "title": "Vedic Guidance, Anywhere",
      "description": "Converse directly with personalized AI deities—Ask Krishna, Shiva, and Hanuman—interpreting ancient Vedic wisdom directly for your modern life challenges.",
      "icon": LucideIcons.sparkles,
      "image": "https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=800&auto=format&fit=crop"
    },
    {
      "title": "The Sound of Eternity",
      "description": "Immerse yourself in high-definition chants, customizable digital Japa Mala, serene guided meditation courses, and sleep sounds crafted for deep spiritual alignment.",
      "icon": LucideIcons.flame,
      "image": "https://images.unsplash.com/photo-1518241353330-0f7941c2d9b5?q=80&w=800&auto=format&fit=crop"
    },
    {
      "title": "Sacred Virtual Portals",
      "description": "Find local temples, book specialized Poojas, receive blessed Prasad at your doorstep, and view daily Panchangs with absolute celestial accuracy.",
      "icon": LucideIcons.compass,
      "image": "https://images.unsplash.com/photo-1626645607073-7e289bf67246?q=80&w=800&auto=format&fit=crop"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Decorative Gradients
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryOrange.withOpacity(0.1),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _showAuth ? _buildAuthForm() : _buildPager(),
                ),
                if (!_showAuth) _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEA580C), Color(0xFFFBBF24)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(LucideIcons.flame, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      children: [
                        const TextSpan(text: "SANATAN "),
                        TextSpan(
                          text: "AI",
                          style: TextStyle(color: AppTheme.primaryOrange),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "VEDIC WISDOM ENGINE",
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: 1.5,
                      color: AppTheme.secondaryAmber,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!_showAuth)
            TextButton(
              onPressed: () => setState(() => _showAuth = true),
              child: const Text(
                "Skip",
                style: TextStyle(color: AppTheme.primaryOrange, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPager() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (idx) => setState(() => _currentSlide = idx),
      itemCount: _slides.length,
      itemBuilder: (context, index) {
        final slide = _slides[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    image: DecorationImage(
                      image: NetworkImage(slide['image']),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: AppTheme.secondaryAmber.withOpacity(0.2), width: 4),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  slide['title'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  slide['description'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_slides.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 6,
                width: _currentSlide == index ? 24 : 6,
                decoration: BoxDecoration(
                  color: _currentSlide == index ? AppTheme.primaryOrange : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              if (_currentSlide < _slides.length - 1) {
                _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
              } else {
                setState(() => _showAuth = true);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_currentSlide == _slides.length - 1 ? 'Begin Sanctuary' : 'Next Lesson'),
                const SizedBox(width: 8),
                Icon(LucideIcons.arrowRight, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthForm() {
    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(LucideIcons.shieldCheck, size: 48, color: AppTheme.primaryOrange),
              const SizedBox(height: 16),
              Text(
                "Access the Sanctuary",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Login via phone or email to synchronize your daily streak and chants.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 32),
              // Simulating the rest of the form...
              TextField(
                decoration: InputDecoration(
                  labelText: "Your Spiritual Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Home
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Unlock App"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
