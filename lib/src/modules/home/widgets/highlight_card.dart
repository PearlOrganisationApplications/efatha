import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HighlightCard extends StatelessWidget {
  const HighlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'KUSANYIKO',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade300,
                  letterSpacing: 4,
                ),
              ),
              Text(
                '2024',
                style: GoogleFonts.outfit(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange.shade600,
                  height: 0.9,
                ),
              ),
              Text(
                'NAMPO YA IMANI',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.chevron_left, color: Colors.blue.shade400),
            ),
          ),
          Positioned(
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.chevron_right, color: Colors.blue.shade400),
            ),
          ),
        ],
      ),
    );
  }
}
