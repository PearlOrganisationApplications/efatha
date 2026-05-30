import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaView extends StatelessWidget {
  const SocialMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Connect with Us on\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Social Media ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Platforms',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Text(
              'Stay Updated by Engaging with Us on Our Social Media Channels',
              textAlign: TextAlign.start,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Efatha Church has many wonderful opportunities ahead, and because of your love and support, thanks to your love and support. We’re leveraging social media to spread the Gospel, sharing the message of salvation and the significance of Jesus Christ’s blood and the Holy Spirit.Click the icons below and subscribe to our social media pages to gain exclusive access to network announcements, live show alerts, livebroadcasts, real-time chat, special offers and much more! Join this new anointed community and be part of what God is doing through Efatha Church',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            _buildSocialGrid(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialGrid() {
    final platforms = [
      {
        'name': 'Facebook',
        'icon': "assets/s1.png",
        'color': Colors.blue.shade900,
      },
      {'name': 'Instagram', 'icon': "assets/s2.png", 'color': Colors.pink},
      {'name': 'WhatsApp', 'icon': "assets/s3.png", 'color': Colors.green},
      {'name': 'TikTok', 'icon': "assets/s4.png", 'color': Colors.black},
      {'name': 'YouTube', 'icon': "assets/s5.png", 'color': Colors.red},
      {'name': 'X', 'icon': "assets/s51.png", 'color': Colors.black87},
      {'name': 'Telegram', 'icon': "assets/s6.png", 'color': Colors.blue},
      {'name': 'Email', 'icon': "assets/s7.png", 'color': Colors.red.shade900},
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      children: platforms.map((p) => _buildPlatformIcon(p)).toList(),
    );
  }

  Widget _buildPlatformIcon(Map<String, dynamic> platform) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Image.asset(platform['icon'] as String),
        ),
        const SizedBox(height: 8),
        Text(
          platform['name'] as String,
          style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
