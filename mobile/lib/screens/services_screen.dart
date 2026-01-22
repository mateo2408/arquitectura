import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPromoBanner(),
            const SizedBox(height: 24),
            Text(
              "Categories",
              style: AppTheme.darkTheme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildCategoriesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF8680FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              FontAwesomeIcons.tag,
              size: 100,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get 20% OFF",
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "On your first vet appointment",
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    final categories = [
      {
        'icon': FontAwesomeIcons.userDoctor,
        'label': 'Veterinarians',
        'color': Color(0xFF4CAF50),
      },
      {
        'icon': FontAwesomeIcons.scissors,
        'label': 'Grooming',
        'color': Color(0xFFE91E63),
      },
      {
        'icon': FontAwesomeIcons.store,
        'label': 'Pet Stores',
        'color': Color(0xFF2196F3),
      },
      {
        'icon': FontAwesomeIcons.bone,
        'label': 'Training',
        'color': Color(0xFFFF9800),
      },
      {
        'icon': FontAwesomeIcons.shieldHeart,
        'label': 'Insurance',
        'color': Color(0xFF9C27B0),
      },
      {
        'icon': FontAwesomeIcons.hotel,
        'label': 'Pet Hotels',
        'color': Color(0xFF00BCD4),
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(categories[index]);
      },
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white.withOpacity(0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (category['color'] as Color).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: FaIcon(
              category['icon'] as IconData,
              color: category['color'] as Color,
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            category['label'] as String,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
