import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'About Us',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 32),
          
          Text(
            'Efatha TV',
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Owned by Efatha Church in Tanzania, is a television network with a mission to share the transformative message of Jesus Christ. With a history of planting over 1,000 churches globally, Efatha Church has over 15 years of experience in media. The network emphasizes healing, deliverance, and hope, operating on Christian principles to serve the community and reflect God\'s love.',
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.black54,
              height: 1.6,
            ),
          ),
          
          const SizedBox(height: 32),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/team_group.png',
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 220,
                color: Colors.grey.shade200,
                child: const Icon(Icons.people, size: 50, color: Colors.grey),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          Center(
            child: Text(
              'EFATHA TV',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildBulletPoints(),
          
          const SizedBox(height: 48),
          Center(
            child: Text(
              'EFATHA TV HOD',
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildHodGrid(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildBulletPoints() {
    final points = [
      'Encourage mutual understanding, trust, and respect of people from all social and religion backgrounds through our programming.',
      'Provide high quality entertainment, news, views and honest, decent, and truthful information.',
      'Highlight and provide a Christian perspective on spiritual, moral and social issues.',
      'Equip groups and individuals with media skills through training and hands-on experience.',
      'Promote local talents and developments in the community.',
      'Raise awareness of our Country in the global community.',
      'Act as a service agency to other broadcasters by providing programmes, training and support.',
      'To be a Christian presence that is clearly defined and effective in the current media landscape.',
      'To be the ‘friendly voice’ on the airwaves, which carries peace, joy, hope, and love in the name of Jesus Christ.',
      'To be a station that is at the service of the community, particularly attentive to the young people, to those who are ill, and to the different communities that exist in the church.',
    ];

    return Column(
      children: points.map((point) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                point,
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildHodGrid() {
    final hods = [
      {'name': 'Daniel Reuben', 'role': 'HOD MEDIA', 'image': 'assets/hod1.png'},
      {'name': 'Paul Elias', 'role': 'HOD TECHNICAL', 'image': 'assets/hod2.png'},
      {'name': 'Sarah Moses', 'role': 'HOD CONTENT', 'image': 'assets/hod3.png'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: hods.map((hod) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  hod['image']!,
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 100,
                    width: 80,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                hod['name']!,
                style: GoogleFonts.outfit(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                hod['role']!,
                style: GoogleFonts.outfit(
                  fontSize: 9,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      )).toList(),
    );
  }
}
