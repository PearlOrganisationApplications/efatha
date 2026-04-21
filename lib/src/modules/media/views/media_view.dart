import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../widgets/media_grid_item.dart';
import 'details/live_stream_view.dart';
import 'details/radio_view.dart';
import 'details/podcast_gallery_view.dart';
import 'details/social_media_view.dart';
import 'details/schedules_view.dart';
import 'details/products_gallery_view.dart';

class MediaView extends StatelessWidget {
  const MediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          _buildGradientBanner(
            context,
            'Live Stream',
            () => Get.to(() => const LiveStreamView()),
          ),
          const SizedBox(height: 32),
          _buildMediaGrid(context),
          const SizedBox(height: 32),
          _buildGradientBanner(
            context,
            'Efatha Shop',
            () => Get.to(() => const ProductsGalleryView()),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGradientBanner(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xFF8B0000), Color(0xFF4B0082)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/logo.png',
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.tv, size: 60, color: Colors.white24),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Transformation Hour',
                    style: GoogleFonts.outfit(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaGrid(BuildContext context) {
    final mediaItems = [
      {
        'title': 'Efatha Radio',
        'icon': Icons.radio,
        'onTap': () => Get.to(() => const RadioView()),
      },
      {
        'title': 'Podcast',
        'icon': Icons.mic,
        'onTap': () => Get.to(() => const PodcastGalleryView()),
      },
      {
        'title': 'Social Media',
        'icon': Icons.share,
        'onTap': () => Get.to(() => const SocialMediaView()),
      },
      {
        'title': 'TV Schedules',
        'icon': Icons.tv_outlined,
        'onTap': () => Get.to(() => const SchedulesView()),
      },
      {
        'title': 'Radio Schedules',
        'icon': Icons.schedule,
        'onTap': () => Get.to(() => const SchedulesView()),
      },
      {
        'title': 'Products',
        'icon': Icons.shopping_cart_outlined,
        'onTap': () => Get.to(() => const ProductsGalleryView()),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: mediaItems.length,
      itemBuilder: (context, index) {
        final item = mediaItems[index];
        return MediaGridItem(
          title: item['title'] as String,
          icon: item['icon'] as IconData,
          onTap: item['onTap'] as VoidCallback,
        );
      },
    );
  }
}
