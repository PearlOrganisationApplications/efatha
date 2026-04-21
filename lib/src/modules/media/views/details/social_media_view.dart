import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaView extends StatelessWidget {
  const SocialMediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Connect with Us on Social Media Platforms',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Stay connected to receive daily updates, spiritual messages and live broadcasts from Efatha TV.',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
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
      {'name': 'Facebook', 'icon': Icons.facebook, 'color': Colors.blue.shade900},
      {'name': 'Instagram', 'icon': Icons.camera_alt, 'color': Colors.pink},
      {'name': 'WhatsApp', 'icon': Icons.phone, 'color': Colors.green},
      {'name': 'TikTok', 'icon': Icons.music_note, 'color': Colors.black},
      {'name': 'YouTube', 'icon': Icons.play_arrow, 'color': Colors.red},
      {'name': 'X', 'icon': Icons.close, 'color': Colors.black87},
      {'name': 'Telegram', 'icon': Icons.send, 'color': Colors.blue},
      {'name': 'Email', 'icon': Icons.email, 'color': Colors.red.shade900},
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
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Icon(platform['icon'] as IconData, color: platform['color'] as Color, size: 32),
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
