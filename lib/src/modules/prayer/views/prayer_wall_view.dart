import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrayerWallView extends StatelessWidget {
  const PrayerWallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRAYER WALL', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          final titles = ['Healing for my mother', 'Financial breakthrough', 'Success in exams', 'Family Protection', 'Spiritual Growth'];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(radius: 12, backgroundColor: Colors.orange, child: Icon(Icons.person, size: 14, color: Colors.white)),
                    const SizedBox(width: 12),
                    Text('Anonymous', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text('2 hours ago', style: GoogleFonts.outfit(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(titles[index], style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                const SizedBox(height: 8),
                Text(
                  'Please pray with me for this specific intention. I believe in the power of agreement.',
                  style: GoogleFonts.outfit(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.volunteer_activism, size: 16, color: Colors.red),
                    const SizedBox(width: 8),
                    Text('12 people prayed', style: GoogleFonts.outfit(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
