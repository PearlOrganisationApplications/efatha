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

class SalvationView extends StatelessWidget {
  SalvationView({super.key});

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
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppText(
                  //   title: "Prayer Request Information",
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  AppText(
                    title: "Accept Jesus Christ Today",
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.appcolor,
                  ),
                  const SizedBox(height: 16),

                  AppText(
                    title:
                        "(Romans 10:9-10) If you declare with your mouth, “Jesus is Lord,” and believe in your heart that God raised him from the dead, you will be saved. 10 For it is with your heart that you believe and are justified, and it is with your mouth that you profess your faith and are saved",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 30,
                      width: 140,
                      child: AppButton(
                        ContainerPadding: EdgeInsets.all(2),
                        onPressed: () {},
                        title: "LEARN MORE",
                        radius: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AppText(
                      color: AppColors.appcolor,
                      title: "Congratulation",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 16),
                  AppText(
                    textAlign: TextAlign.center,
                    title:
                        'Please help us by filling out the form below so that we can assist you further.as',
                  ),
                  const SizedBox(height: 16),

                  AppTextField(label: "Address", hint: "Enter your Address"),
                  const Gap(12),
                  AppTextField(
                    label: "Full Name",
                    hint: "Enter your full name",
                  ),
                  const Gap(12),

                  AppTextField(label: "Email", hint: "Enter your email"),
                  const Gap(12),

                  AppTextField(
                    label: "Mobile Number",
                    hint: "Enter your mobile number",
                  ),
                  const Gap(12),

                  AppTextField(label: "Province", hint: "Province"),

                  // const Gap(12),

                  // AppTextField(
                  //   label: "Prayer Text",
                  //   hint: "Type your prayer request here",
                  //   maxLines: 5, // if supported
                  // ),
                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: AppButton(
                      radius: 22,
                      onPressed: () {},
                      title: "SUBMIT",
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

Widget _buildCard({required String image, required String title}) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          AppText(title: title, fontSize: 16, fontWeight: FontWeight.w600),
        ],
      ),
    ),
  );
}
