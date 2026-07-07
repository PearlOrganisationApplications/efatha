import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart'
    show IndexController;
import 'package:efatha_tv/src/modules/media/views/details/audio.card.dart'
    show PodcastPlayerCard;
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
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

class SchedulesView extends StatelessWidget {
  const SchedulesView({super.key});

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

            onTranslateTap: () =>
                Get.snackbar('Language', 'Language selection coming soon'),
            onSearchTap: () =>
                Get.snackbar('Search', 'Search feature coming soon'),
          );
        }),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Broadcast ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Schedules',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 34),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              //  margin: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  AppText(
                    textAlign: .start,
                    title: "Efatha Television",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(5),
                  AppText(
                    textAlign: .start,
                    title: "TV Schedules",
                    color: Colors.blue,

                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(20),
                  Align(
                    alignment: .center,
                    child: AppText(title: "Today’s Schedule", fontSize: 15),
                  ),
                  Gap(30),
                  ScheduleHeader(),

                  ShowScheduleTile(
                    showName: "Mkate wa Uzima",
                    days: "Monday to Friday",
                    timing: "9:00 PM - 10:00 PM",
                  ),
                  //  const SizedBox(height: 2),
                  ShowScheduleTile(
                    showName: "Mkate wadsfsdfsdfsdf Uzima",
                    days: "Monday to Fsdfdsfsdfsdriday",
                    timing: "9:00 PM - 10:00 PM",
                  ),

                  //Spacer(),
                  Gap(30),
                  Center(
                    child: AppButton(
                      radius: 23,
                      height: 30,
                      width: 150,
                      onPressed: () {},
                      title: "VISIT EFATHA TV",
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

  Widget _buildScheduleSection(String provider, String type) {
    final schedules = [
      {'time': '06:00 AM', 'program': 'Morning Glory'},
      {'time': '09:00 AM', 'program': 'Kingdom Life'},
      {'time': '01:00 PM', 'program': 'Transformation Hour'},
      {'time': '04:00 PM', 'program': 'Youth Impact'},
      {'time': '08:00 PM', 'program': 'Night Prayer'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                provider,
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                type,
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          ...schedules
              .map(
                (s) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          s['time']!,
                          style: GoogleFonts.outfit(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          s['program']!,
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.notifications_none,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(160, 40),
              ),
              child: const Text('WATCH NOW'),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCategoryNavigation(String category) {
    switch (category) {
      case 'Giving':
        Get.to(() => GivingHubView());
        break;
      case 'Donate':
        Get.to(() => DonateView());
        break;
      case 'Mobile Payment':
        Get.to(() => MobilePaymentView());
        break;
      case 'Global Giving':
        Get.to(() => GlobalGivingView());
        break;
      case 'Wire Transfer':
        Get.to(() => WireTransferView());
        break;
      case 'Prayer':
        Get.to(() => PrayerHubView());
        break;
      case 'Prayer Request':
        Get.to(() => PrayerRequestView());
        break;
      case 'Prayer Wall':
        Get.to(() => const PrayerWallView());
        break;
      case 'Salvation':
        Get.to(() => SalvationView());
        break;
      case 'Partners':
        Get.to(() => PartnersHubView());
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

class ShowScheduleTile extends StatelessWidget {
  final String showName;
  final String days;
  final String timing;

  const ShowScheduleTile({
    super.key,
    required this.showName,
    required this.days,
    required this.timing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              showName,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          Gap(20),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  days,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                Text(
                  timing,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black54)),
      ),
      child: const Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Show Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "Show Timing",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
