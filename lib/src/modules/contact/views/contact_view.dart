import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/widgets/custom_text_field.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CONNECT WITH US',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text("GET IN TOUCH"),
            Text(
              "Have a question or comment? Please send us an email or call if you need an immediate assistance. We’d love to hear from you!",
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(Icons.gps_fixed),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mailing Address",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Efatha TV at Efatha Church Mwenge, 66QH+8P6, Dar es Salaam",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(Icons.gps_fixed),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Efatha TV at Efatha Church Mwenge, 66QH+8P6, Dar es Salaam",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Icon(Icons.gps_fixed),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text("efathatv@efathachurch.org"),
                    ],
                  ),
                ),
              ],
            ),
            Text("INFORMATION ABOUT US"),
            Text("CONTACT US FOR ANY QUESTIONS"),
            Gap(10),

            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Your Name"),

                      AppTextField(label: "", hint: ""),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Your Email"),
                      AppTextField(label: "", hint: ""),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Phone Number"),
                      Gap(10),
                      AppTextField(label: "", hint: ""),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    children: [
                      Text("Company"),
                      AppTextField(label: "", hint: ""),
                    ],
                  ),
                ),
              ],
            ),
            Text("Your Message"),
            AppTextField(label: "", hint: "", maxLines: 8),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,

                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("SUBMIT", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
