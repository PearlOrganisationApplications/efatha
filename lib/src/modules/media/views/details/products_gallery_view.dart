import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:efatha_tv/src/modules/contact/views/contact_view.dart';
import 'package:efatha_tv/src/modules/giving/views/donate_view.dart';
import 'package:efatha_tv/src/modules/giving/views/giving_hub_view.dart';
import 'package:efatha_tv/src/modules/giving/views/global_giving_view.dart';
import 'package:efatha_tv/src/modules/giving/views/mobile_payment_view.dart';
import 'package:efatha_tv/src/modules/giving/views/wire_transfer_view.dart';

import 'package:efatha_tv/src/modules/partners/views/international_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/local_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/partners_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_hub_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_request_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_wall_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/salvation_view.dart';

class ProductsGalleryView extends StatelessWidget {
  ProductsGalleryView({super.key});
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

      body: GridView.count(
        padding: const EdgeInsets.all(24),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.9,
        children: [
          _buildCategoryCard('Bibles', "assets/b1.png", Colors.blue.shade900),
          _buildCategoryCard('Audio', "assets/b2.png", Colors.orange.shade800),
          _buildCategoryCard('DVD', "assets/b3.png", Colors.red.shade800),
          _buildCategoryCard(
            'EFATHA PRODUCTS',
            "assets/b1.png",
            Colors.teal.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),

          SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
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
