import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_text_field.dart';

class PrayerRequestView extends StatelessWidget {
  const PrayerRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRAYER REQUEST', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Share your prayer points with us. Our prayer warriors are ready to stand in the gap with you.',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 32),
            const AppTextField(label: 'Enter Name', hint: 'Full Name'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Email Address', hint: 'yourname@example.com'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Phone Number', hint: '+255...'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Prayer Title', hint: 'e.g., Healing, Family, Job'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Prayer Point', hint: 'Type your request here...', maxLines: 5),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('SUBMIT REQUEST', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
