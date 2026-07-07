import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
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

class GlobalGivingView extends StatelessWidget {
  GlobalGivingView({super.key});

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
              title: "Global giving",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 12),
            Image.asset("assets/w1.png"),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppCachedImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1438232992991-995b7058bbb3?w=1200&q=80",
              ),
            ),
            const SizedBox(height: 12),

            AppText(
              title: "Partner with Us Now",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 12),
            AppText(
              title:
                  "We welcome you to a life-changing opportunity to become a Partner in sharing the good news of Jesus Christ.\n\n"
                  "Efatha TV's support is having a global impact. Efatha TV Partners are transforming lives around the clock. Our lives are the answer to somebody's question and the solution to somebody's problem. Every single day, across the earth, somebody steps into their destiny because of our obedience. Jesus said, \"Go\"; and that is what we are doing. But we realize it takes more than our anointing to do the job. It also takes your support, faith, prayers, and finances.\n\n"
                  "We understand the spiritual principle of synergy. We know that when we combine forces, the results will be far greater than the mere addition of our strengths. This is why we invite you to partner with us.\n\n"
                  "Support us on a regular basis by signing up to be an Efatha TV Partner today.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.justify,
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
