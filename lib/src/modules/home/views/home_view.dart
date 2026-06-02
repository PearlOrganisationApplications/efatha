import 'dart:ui';

import 'package:efatha_tv/src/modules/media/views/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_hero_banner.dart';
import '../widgets/program_grid_item.dart';
import '../widgets/highlight_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/shimmer_loading.dart';
import '../../home/views/home_view.dart';
import '../../about/views/about_view.dart';
import '../../media/views/media_view.dart';
import '../../shop/views/shop_view.dart';
import '../../auth/views/profile_view.dart';
import '../../giving/views/giving_hub_view.dart';
import '../../giving/views/donate_view.dart';
import '../../giving/views/mobile_payment_view.dart';
import '../../giving/views/global_giving_view.dart';
import '../../giving/views/wire_transfer_view.dart';
import '../../prayer/views/prayer_hub_view.dart';
import '../../prayer/views/prayer_request_view.dart';
import '../../prayer/views/prayer_wall_view.dart';
import '../../prayer/views/salvation_view.dart';
import '../../partners/views/partners_view.dart';
import '../../partners/views/local_partner_view.dart';
import '../../partners/views/international_partner_view.dart';
import '../../contact/views/contact_view.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';

class HomeView extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.posts.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      final mockPrograms = [
        {'title': 'Hello World', 'image': 'assets/images/home1.png'},
        {'title': 'Safari ya imani', 'image': 'assets/images/home2.png'},
        {'title': 'Kids Smile', 'image': 'assets/images/home3.png'},
        {'title': 'Nuru ya Ulimwengu', 'image': 'assets/images/home4.png'},
        {'title': 'Mkate wa Uzima', 'image': 'assets/images/home5.png'},
        {'title': 'Mtembeo wa Mwanamke', 'image': 'assets/images/home6.png'},
        {'title': 'Domy', 'image': 'assets/images/home7.png'},
        {'title': 'How I Met Jesus', 'image': 'assets/images/home8.png'},
        {'title': 'Praise and Worship', 'image': 'assets/images/home9.png'},
        {'title': 'Testimonial', 'image': 'assets/images/home10.png'},
        {'title': 'Apostolic Crusade', 'image': 'assets/images/home11.png'},
        {'title': 'Documentary', 'image': 'assets/images/home12.png'},
      ];

      return RefreshIndicator(
        onRefresh: controller.fetchContent,
        child: Column(
          crossAxisAlignment: .center,
          children: [
            _buildCategoryRow(),

            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(6),
                        child: CastrPlayerScreen(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const AppSectionHeader(title: 'OUR PROGRAMS'),
                    const SizedBox(height: 12),

                    // GridView — 3 columns, 2 rows
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mockPrograms.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.72, // <-- yeh change karo
                            ),

                        itemBuilder: (context, index) => ProgramGridItem(
                          program: mockPrograms[index],
                          index: index,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                    const AppSectionHeader(
                      title: 'EVENT HIGHLIGHTS',
                      showActionButton: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Image.asset(
                            "assets/h1.png",
                            fit: .cover,
                            height: 100,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCategoryRow() {
    final controller = Get.find<HomeController>();

    final categories = [
      'Giving',
      'Donate',
      'Mobile Payment',
      'Global Giving',
      'Wire Transfer',
      'Prayer',
      'Prayer Request',
      'Prayer Wall',
      'Salvation',
      'Partners',
      'Local Partner',
      'International Partner',
      'Contact',
    ];

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        child: ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: controller.isBlur.value ? 5 : 0,
            sigmaY: controller.isBlur.value ? 5 : 0,
          ),

          child: Opacity(
            opacity: controller.isBlur.value ? 0.6 : 1,

            child: SizedBox(
              height: 48,

              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,

                separatorBuilder: (context, index) => const SizedBox(width: 12),

                itemBuilder: (context, index) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        _handleCategoryNavigation(categories[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black12),
                        ),

                        child: Text(
                          categories[index],

                          style: GoogleFonts.outfit(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showArrows = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showArrows)
            Icon(
              Icons.arrow_circle_left,
              color: Colors.blue.shade400,
              size: 28,
            ),
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
            Icon(
              Icons.arrow_circle_right,
              color: Colors.blue.shade400,
              size: 28,
            ),
        ],
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
            child: Icon(
              Icons.arrow_circle_left,
              color: Colors.blue.shade400,
              size: 28,
            ),
          ),
          Positioned(
            right: -15,
            child: Icon(
              Icons.arrow_circle_right,
              color: Colors.blue.shade400,
              size: 28,
            ),
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

  void _handleCategoryNavigation(String category) {
    switch (category) {
      case 'Giving':
        Get.to(() => const GivingHubView());
        break;
      case 'Donate':
        Get.to(() => const DonateView());
        break;
      case 'Mobile Payment':
        Get.to(() => const MobilePaymentView());
        break;
      case 'Global Giving':
        Get.to(() => const GlobalGivingView());
        break;
      case 'Wire Transfer':
        Get.to(() => const WireTransferView());
        break;
      case 'Prayer':
        Get.to(() => const PrayerHubView());
        break;
      case 'Prayer Request':
        Get.to(() => const PrayerRequestView());
        break;
      case 'Prayer Wall':
        Get.to(() => const PrayerWallView());
        break;
      case 'Salvation':
        Get.to(() => const SalvationView());
        break;
      case 'Partners':
        Get.to(() => const PartnersHubView());
        break;
      case 'Local Partner':
        Get.to(() => const LocalPartnerView());
        break;
      case 'International Partner':
        Get.to(() => const InternationalPartnerView());
        break;
      case 'Contact':
        Get.to(() => const ContactView());
        break;
    }
  }
}
