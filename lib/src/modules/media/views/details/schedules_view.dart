import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchedulesView extends StatelessWidget {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Broadcast Schedules',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildScheduleSection('Efatha Television', 'TV Schedules'),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleSection(String provider, String type) {
    final schedules = [
      {'time': '06:00 AM', 'program': 'Morning Glory'},
      {'time': '09:00 AM', 'program': 'Kingdom Life'},
      {'time': '01:00 PM', 'program': 'Transformation Hour'},
      {'time': '04:00 PM', 'program': 'Youth Impact'},
      {'time': '08:00 PM', 'program': 'Night Prayer'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(provider, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                type,
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Divider(height: 32),
          ...schedules.map((s) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    s['time']!,
                    style: GoogleFonts.outfit(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Text(
                    s['program']!,
                    style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.notifications_none, size: 18, color: Colors.grey),
              ],
            ),
          )).toList(),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                minimumSize: const Size(160, 40),
              ),
              child: const Text('WATCH NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
