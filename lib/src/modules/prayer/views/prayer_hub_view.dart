import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/action_card.dart';
import 'prayer_request_view.dart';
import 'prayer_wall_view.dart';
import 'salvation_view.dart';

class PrayerHubView extends StatelessWidget {
  const PrayerHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PRAYER',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppActionCard(
              title: 'Prayer Request',
              icon: Icons.record_voice_over,
              color: Colors.blue.shade600,
              onTap: () => Get.to(() => const PrayerRequestView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'Prayer Wall',
              icon: Icons.groups,
              color: Colors.cyan.shade600,
              onTap: () => Get.to(() => const PrayerWallView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'Salvation',
              icon: Icons.auto_awesome,
              color: Colors.indigo.shade600,
              onTap: () => Get.to(() => const SalvationView()),
            ),
          ],
        ),
      ),
    );
  }
}
