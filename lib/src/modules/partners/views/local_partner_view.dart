import '../../../shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LocalPartnerView extends StatelessWidget {
  const LocalPartnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOCAL PARTNER',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const AppTextField(label: 'Full Name', hint: 'Enter your name'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Email', hint: 'email@example.com'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Phone', hint: '+255...'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Region', hint: 'e.g., Dar Es Salaam'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('REGISTER AS PARTNER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
