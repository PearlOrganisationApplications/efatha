import 'package:flutter/material.dart';
import '../../../shared/widgets/action_card.dart';
import 'donate_view.dart';
import 'mobile_payment_view.dart';
import 'global_giving_view.dart';
import 'wire_transfer_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GivingHubView extends StatelessWidget {
  const GivingHubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GIVING',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppActionCard(
              title: 'GIVING',
              icon: Icons.favorite,
              color: Colors.blue.shade600,
              onTap: () => Get.to(() => const DonateView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'MOBILE GIVING',
              icon: Icons.phone_android,
              color: Colors.cyan.shade600,
              onTap: () => Get.to(() => const MobilePaymentView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'GLOBAL GIVING',
              icon: Icons.public,
              color: Colors.blue.shade800,
              onTap: () => Get.to(() => const GlobalGivingView()),
            ),
            const SizedBox(height: 16),
            AppActionCard(
              title: 'WIRE TRANSFER',
              icon: Icons.account_balance,
              color: Colors.blue.shade900,
              onTap: () => Get.to(() => const WireTransferView()),
            ),
          ],
        ),
      ),
    );
  }
}
