import 'package:efatha_tv/src/modules/contact/views/contact_view.dart';
import 'package:efatha_tv/src/modules/giving/views/donate_view.dart';
import 'package:efatha_tv/src/modules/giving/views/giving_hub_view.dart';
import 'package:efatha_tv/src/modules/giving/views/global_giving_view.dart';
import 'package:efatha_tv/src/modules/giving/views/mobile_payment_view.dart';
import 'package:efatha_tv/src/modules/giving/views/wire_transfer_view.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';
import 'package:efatha_tv/src/modules/partners/views/international_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/local_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/partners_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_hub_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_request_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_wall_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/salvation_view.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart'
    show ExtensionSnackbar, GetNavigation;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaView extends StatelessWidget {
  SocialMediaView({super.key});
  final controller = Get.find<IndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: Obx(() {
          // if (controller.currentIndex == 3 || controller.currentIndex == 4) {
          //   return const SizedBox.shrink();
          // }
          return CustomAppBar(
            userName: '',
            selectedCategory: controller.selectedCategory.value,
            onTranslateTap: () =>
                Get.snackbar('Language', 'Language selection coming soon'),
            onSearchTap: () =>
                Get.snackbar('Search', 'Search feature coming soon'),
            onCategorySelected: (category) {
              controller.updateCategory(category);
              _handleCategoryNavigation(category);
            },
          );
        }),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Connect with Us on\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Social Media ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Platforms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Text(
              'Stay Updated by Engaging with Us on Our Social Media Channels',
              textAlign: TextAlign.start,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Efatha Church has many wonderful opportunities ahead, and because of your love and support, thanks to your love and support. We’re leveraging social media to spread the Gospel, sharing the message of salvation and the significance of Jesus Christ’s blood and the Holy Spirit.Click the icons below and subscribe to our social media pages to gain exclusive access to network announcements, live show alerts, livebroadcasts, real-time chat, special offers and much more! Join this new anointed community and be part of what God is doing through Efatha Church',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            _buildSocialGrid(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialGrid() {
    final platforms = [
      {'name': '', 'icon': "assets/s1.png", 'color': Colors.blue.shade900},
      {'name': '', 'icon': "assets/s2.png", 'color': Colors.pink},
      {'name': '', 'icon': "assets/s3.png", 'color': Colors.green},
      {'name': '', 'icon': "assets/s4.png", 'color': Colors.black},
      {'name': '', 'icon': "assets/s5.png", 'color': Colors.red},
      {'name': '', 'icon': "assets/s51.png", 'color': Colors.black87},
      {'name': '', 'icon': "assets/s6.png", 'color': Colors.blue},
      {'name': '', 'icon': "assets/s8.png", 'color': Colors.red.shade900},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: platforms.map((p) => _buildPlatformIcon(p)).toList(),
    );
  }

  Widget _buildPlatformIcon(Map<String, dynamic> platform) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Image.asset(platform['icon'] as String),
        ),
        const SizedBox(height: 8),
        Text(
          platform['name'] as String,
          style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
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
