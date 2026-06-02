import '../../../shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InternationalPartnerView extends StatelessWidget {
  const InternationalPartnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'INTERNATIONAL PARTNER',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "International Register",
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(
              "Log in to your account dashboard to watch Efatha TV, Listen to Podcasts and Online Radio, view your recent orders, manage your shipping and billing addresses, and edit your password and account details.",
            ),

            Text(
              "Become an Efatha TV Partner by registering for this site. Just fill in the fields below, and we’ll set up a new account for you in no time. We will only ask you for the information necessary to make the process faster and easier.",
            ),
            AppTextField(label: 'Full Name', hint: 'Enter your name'),
            const AppTextField(label: 'Full Name', hint: 'Enter your name'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Email', hint: 'email@example.com'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Country', hint: 'e.g., USA, UK, Kenya'),
            const SizedBox(height: 20),
            const AppTextField(label: 'Address', hint: 'Detailed address'),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('JOIN AS GLOBAL PARTNER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
