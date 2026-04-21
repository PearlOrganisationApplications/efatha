import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DONATE', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue.shade900, Colors.blue.shade600]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'PARTNER WITH US NOW',
                    style: GoogleFonts.outfit(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We invite you to partner with Efatha Ministry and help us spread the word of God globally. Your contributions make a significant impact in lives of many.',
                    style: GoogleFonts.outfit(color: Colors.white70, fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'About Giving',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Your generous support enables us to continue our mission of outreach, community support, and spiritual growth. We believe in transparency and every cent you give is directed towards ministry activities and aid programs.\n\n"Give, and it will be given to you. A good measure, pressed down, shaken together and running over, will be poured into your lap." - Luke 6:38',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.black87, height: 1.6),
            ),
            const SizedBox(height: 32),
            _buildInfoCard(Icons.verified_user, 'Secure Transaction', 'All donations are processed securely.'),
            const SizedBox(height: 16),
            _buildInfoCard(Icons.receipt_long, 'Tax Benefits', 'Your donations may be tax-deductible.'),
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
              Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
              Text(sub, style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
