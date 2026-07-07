import 'package:efatha_tv/src/modules/contact/views/contact_view.dart';
import 'package:efatha_tv/src/modules/dashboard/views/dashboard_view.dart';
import 'package:efatha_tv/src/modules/giving/views/giving_hub_view.dart';
import 'package:efatha_tv/src/modules/home/views/home_view.dart';
import 'package:efatha_tv/src/modules/partners/views/partners_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_hub_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Import your screens

class IndexController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final selectedCategory = ''.obs;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.userName = 'George',
    this.onTranslateTap,
    this.onSearchTap,
    this.isFromHome = false,
  });

  final String userName;
  final VoidCallback? onTranslateTap;
  final VoidCallback? onSearchTap;
  bool isFromHome = false;

  final IndexController controller = Get.find<IndexController>();

  void _onCategorySelected(String category) {
    if (controller.selectedCategory.value == category) return;

    controller.updateCategory(category);
    _handleCategoryNavigation(category, isFromHome);
  }

  void _handleCategoryNavigation(String category, bool fromHome) {
    print(isFromHome.toString());
    switch (category) {
      case 'Giving':
        fromHome
            ? Get.to(() => GivingHubView())
            : Get.off(() => GivingHubView());
        break;

      case 'Prayer':
        fromHome
            ? Get.to(() => PrayerHubView())
            : Get.off(() => PrayerHubView());
        break;

      case 'Partners':
        fromHome
            ? Get.to(() => PartnersHubView())
            : Get.off(() => PartnersHubView());
        break;

      case 'Contact':
        fromHome
            ? Get.to(() => const ContactView())
            : Get.off(() => const ContactView());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            spreadRadius: 3,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != HomeView().toString()) {
                        Get.offAll(() => DashboardView());
                      }
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      height: 50,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.tv, color: Colors.blue),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      userName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: onTranslateTap,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Image.asset(
                        "assets/lang.png",
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  GestureDetector(
                    onTap: onSearchTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),

            buildCategoryRow(),

            const Gap(5),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryRow() {
    final categories = ['Giving', 'Prayer', 'Partners', 'Contact'];

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = controller.selectedCategory.value == category;
          return Center(
            child: InkWell(
              onTap: () => _onCategorySelected(category),

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade700 : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? Colors.blue.shade700
                        : Colors.grey.shade300,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  categories[index],
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(115);
}
