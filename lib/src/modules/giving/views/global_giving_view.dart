import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalGivingView extends StatelessWidget {
  const GlobalGivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GLOBAL GIVING', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(Icons.public, color: Colors.white, size: 60),
                  const SizedBox(height: 20),
                  Text(
                    'REACHING SOULS GLOBALLY',
                    style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Partner with Efatha',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Efatha Ministry is committed to spreading the word of God to every corner of the earth. We use global outreach, digital platforms, and satellite TV to reach the unreached.\n\nYour global gift helps us maintain our satellite broadcast and fund international mission trips.',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade700, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            _buildSecureLogoRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildSecureLogoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.payment, size: 40, color: Colors.blue),
        const SizedBox(width: 16),
        Text('PayPal', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(width: 8),
        Text('VISA', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic)),
      ],
    );
  }
}
