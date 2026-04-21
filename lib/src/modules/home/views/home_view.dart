import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_hero_banner.dart';
import '../widgets/program_grid_item.dart';
import '../widgets/highlight_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/shimmer_loading.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.posts.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      final mockPrograms = [
        {'title': 'Hello World', 'image': 'https://placehold.co/400x300/blue/white/png?text=Hello+World'},
        {'title': 'Safari ya imani', 'image': 'https://placehold.co/400x300/purple/white/png?text=Safari+ya+imani'},
      ];

      return RefreshIndicator(
        onRefresh: controller.fetchContent,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeroBanner(),
              const SizedBox(height: 24),
              const AppSectionHeader(title: 'OUR PROGRAMS'),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: mockPrograms.length,
                  itemBuilder: (context, index) => ProgramGridItem(program: mockPrograms[index]),
                ),
              ),
              const SizedBox(height: 32),
              const AppSectionHeader(title: 'EVENT HIGHLIGHTS'),
              const HighlightCard(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSectionHeader(String title, {bool showArrows = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showArrows)
            Icon(Icons.arrow_circle_left, color: Colors.blue.shade400, size: 28),
          if (showArrows) const Spacer(),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Colors.black87,
            ),
          ),
          if (showArrows) const Spacer(),
          if (showArrows)
            Icon(Icons.arrow_circle_right, color: Colors.blue.shade400, size: 28),
        ],
      ),
    );
  }

  Widget _buildProgramsList() {
    final mockPrograms = [
      {'title': 'Hello World', 'image': 'https://placehold.co/400x300/blue/white/png?text=Hello+World'},
      {'title': 'Safari ya imani', 'image': 'https://placehold.co/400x300/purple/white/png?text=Safari+ya+imani'},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: mockPrograms.length,
        itemBuilder: (context, index) {
          final program = mockPrograms[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      program['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      program['title']!,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventHighlights() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildHighlightCardContent(),
          Positioned(
            left: -15,
            child: Icon(Icons.arrow_circle_left, color: Colors.blue.shade400, size: 28),
          ),
          Positioned(
            right: -15,
            child: Icon(Icons.arrow_circle_right, color: Colors.blue.shade400, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'KUSANYIKO',
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade400,
            letterSpacing: 2,
          ),
        ),
        Text(
          '2024',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.orange.shade400,
            height: 0.8,
          ),
        ),
        Text(
          'NAMPO YA IMANI',
          style: GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingSkeleton(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
