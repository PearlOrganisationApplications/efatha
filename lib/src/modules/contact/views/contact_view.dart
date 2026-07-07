import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_text_field.dart';
import 'package:efatha_tv/src/core/values/app_colors.dart';
import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:efatha_tv/src/shared/widgets/custom_text_field.dart';
import 'package:efatha_tv/utils/cached.iamge.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: AppText(
                title: "CONNECT WITH US",
                color: AppColors.appcolor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(15),
            Gap(10),
            AppText(title: "GET IN TOUCH", fontWeight: .w700, fontSize: 22),
            Gap(10),
            Text(
              "Have a question or comment? Please send us an email or call if you need an immediate assistance. We’d love to hear from you!",
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF19A7E0),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/c1.png",
                        width: 22,
                        height: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Mailing Address",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Efatha TV at Efatha Church Mwenge, 66QH+8P6, Dar es Salaam",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                            letterSpacing: 0.4,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF19A7E0),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/c2.png",
                        width: 22,
                        height: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Phone Number+255 787432710 , +255 866217",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                            letterSpacing: 0.4,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF19A7E0),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/c3.png",
                        width: 22,
                        height: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "EMAIL ADDRESS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: Color(0xFF2D2D2D),
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "EFATHATV@EFATHACHURCH.ORG",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade700,
                            letterSpacing: 0.4,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(15),
            Text(
              "INFORMATION ABOUT US",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
                color: Color(0xFF2D2D2D),
              ),
            ),
            Gap(5),
            Text(
              "CONTACT US FOR ANY QUESTIONS",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: Colors.black,
              ),
            ),
            Gap(10),
            Gap(15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(label: "Your Name", hint: "Your Name"),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextField(label: "Your Email", hint: "Your Email"),
                    ],
                  ),
                ),
              ],
            ),
            Gap(10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      AppTextField(label: "Phone Number", hint: "Phone Number"),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    children: [AppTextField(label: "Company", hint: "Company")],
                  ),
                ),
              ],
            ),
            Gap(30),
            AppTextField(
              label: "Your Message",
              hint: "Your Message",
              maxLines: 8,
            ),
            Gap(15),
            Gap(15),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,

                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("SUBMIT", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
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
