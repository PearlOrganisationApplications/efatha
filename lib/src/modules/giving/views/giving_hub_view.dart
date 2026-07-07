import 'package:efatha_tv/src/modules/shop/views/app.text.dart' show AppText;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/widgets/action_card.dart';
import 'donate_view.dart';
import 'mobile_payment_view.dart';
import 'global_giving_view.dart';
import 'wire_transfer_view.dart';
import 'package:get/get.dart';

import '../../index/controllers/index_controller.dart';

import '../../prayer/views/prayer_hub_view.dart';
import '../../prayer/views/prayer_request_view.dart';
import '../../prayer/views/prayer_wall_view.dart';
import '../../prayer/views/salvation_view.dart';
import '../../partners/views/partners_view.dart';
import '../../partners/views/local_partner_view.dart';
import '../../partners/views/international_partner_view.dart';
import '../../contact/views/contact_view.dart';
import '../../../shared/widgets/custom_app_bar.dart';

class GivingHubView extends StatelessWidget {
  GivingHubView({super.key});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => DonateView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff04A3DA),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 70,

                      //    padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          "DONATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => MobilePaymentView());
                    },
                    child: Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      //    padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff04A3DA),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "MOBILE GIVING",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => GlobalGivingView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff04A3DA),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 70,

                      //    padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: Text(
                          "GLOBAL GIVING",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => WireTransferView());
                    },
                    child: Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      //    padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff04A3DA),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "WIRE TRANSFER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: "PARTNER WITH US NOW",

                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),

                const SizedBox(height: 12),
                AppText(
                  title:
                      "We welcome you to a life-changing opportunity to become a partner in sharing the Good News of Jesus Christ.\n\n"
                      "Efatha TV's support is having a global impact. Efatha TV Partners are transforming lives around the clock. Our lives are the answer to somebody's question and the solution to somebody's problem. Every single day, across the earth, somebody steps into their destiny because of our obedience.\n\n"
                      "Jesus said, \"Go,\" and that is what we are doing. But we realize it takes more than our anointing to do the job. It also takes your support, faith, prayers, and financial contributions.\n\n"
                      "We understand the spiritual principle of synergy. We know that when we combine forces, the results are far greater than the mere addition of our individual strengths. This is why we invite you to partner with us.\n\n"
                      "Support us on a regular basis by signing up to become an Efatha TV Partner today.",
                ),
              ],
            ),
          ],
        ),
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
