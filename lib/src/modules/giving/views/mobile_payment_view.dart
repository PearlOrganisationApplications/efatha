import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:efatha_tv/utils/cached.iamge.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MobilePaymentView extends StatelessWidget {
  MobilePaymentView({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: "Mobile Giving",
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
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
              title: "BECOME A EFATHA TV PARTNER",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 12),
            Text(
              "We welcome you to a life-changing opportunity to become a Partner in sharing the good news of Jesus Christ.\n\n"
              "Efatha TV's support is having a global impact. Efatha TV Partners are transforming lives around the clock. Our lives are the answer to somebody's question and the solution to somebody's problem. Every single day, across the earth, somebody steps into their destiny because of our obedience. Jesus said, \"Go\"; and that is what we are doing. But we realize it takes more than our anointing to do the job. It also takes your support, faith, prayers, and finances.\n\n"
              "We understand the spiritual principle of synergy. We know that when we combine forces, the results will be far greater than the mere addition of our strengths. This is why we invite you to partner with us.\n\n"
              "Support us on a regular basis by signing up to be an Efatha TV Partner today.",
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
