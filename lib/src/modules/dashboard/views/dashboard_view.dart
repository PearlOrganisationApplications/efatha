import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../index/controllers/index_controller.dart';
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

class DashboardView extends GetView<IndexController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // If controller is not yet initialized, we can use Get.find
    final controller = Get.find<IndexController>();

    final List<Widget> screens = [
      const HomeView(),
      const AboutView(),
      const MediaView(),
      const ShopView(),
      const ProfileView(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: Obx(() {
          if (controller.currentIndex == 3 || controller.currentIndex == 4) {
            return const SizedBox.shrink();
          }
          return CustomAppBar(
            userName: 'Gorge',
            selectedCategory: controller.selectedCategory.value,
            onTranslateTap: () => Get.snackbar('Language', 'Language selection coming soon'),
            onSearchTap: () => Get.snackbar('Search', 'Search feature coming soon'),
            onCategorySelected: (category) {
              controller.updateCategory(category);
              _handleCategoryNavigation(category);
            },
          );
        }),
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex,
            children: screens,
          )),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.changeIndex(index);
          },
        ),
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
