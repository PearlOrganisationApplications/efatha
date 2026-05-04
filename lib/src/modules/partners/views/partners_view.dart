import 'package:efatha_tv/src/shared/widgets/action_card.dart';
import 'local_partner_view.dart';
import 'international_partner_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnersHubView extends StatelessWidget {
  const PartnersHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PARTNERS',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppActionCard(
              title: 'Partner Registration',
              icon: Icons.person_add,
              color: Colors.blue.shade600,
              onTap: () => Get.to(() => const LocalPartnerView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'International Partner',
              icon: Icons.public,
              color: Colors.cyan.shade600,
              onTap: () => Get.to(() => const InternationalPartnerView()),
            ),
          ],
        ),
      ),
    );
  }
}
