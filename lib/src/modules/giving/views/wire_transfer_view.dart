import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:efatha_tv/utils/cached.iamge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:efatha_tv/src/modules/media/views/details/products_gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class WireTransferView extends StatelessWidget {
  WireTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: CustomAppBar(
          userName: '',

          onTranslateTap: () =>
              Get.snackbar('Language', 'Language selection coming soon'),
          onSearchTap: () =>
              Get.snackbar('Search', 'Search feature coming soon'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              title: "Wire Transfer",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 12),
            Image.asset("assets/w2.png"),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  AppText(
                    title: "Efatha TV Partiner's\nConnect with Us here and now",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    letterSpacing: 2,
                  ),
                  const SizedBox(height: 12),

                  AppText(
                    title:
                        "To transfer funds directly to Efatha TV Partners, please use the information provided below.\n\n"
                        "After completing your donation, please send an email to partners@efatha.com including the partner's name, contact information, donation date, and donation amount so that we can properly acknowledge your gift.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),

                  AppText(
                    title: "For Domestic and International Wire Transfers",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    letterSpacing: 1.2,
                  ),
                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: AppText(
                      title:
                          "Beneficiary Bank:\n\n"
                          "Lorem Ipsum: 021000021\n"
                          "Lorem Ipsum: CHASUS33XXX\n"
                          "XYZ Bank\n"
                          "ABC Lorem Ipsum - 1100221",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 20),

                  AppButton(
                    onPressed: () {},
                    radius: 22,
                    fontSize: 13,
                    title: "Connect with US for more information",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade700),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
              Text(
                sub,
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
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
