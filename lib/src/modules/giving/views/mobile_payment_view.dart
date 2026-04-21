import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobilePaymentView extends StatelessWidget {
  const MobilePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MOBILE GIVING', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(child: Icon(Icons.smartphone, size: 80, color: Colors.grey)),
            ),
            const SizedBox(height: 24),
            Text(
              'PAYMENT INSTRUCTIONS',
              style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Follow these steps to give via mobile money platforms. Your support helps us reach more souls.',
              style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 24),
            _buildProviderLogoRow(),
            const SizedBox(height: 32),
            _buildStep(1, 'Dial *150*00# (M-Pesa) or corresponding USSD.'),
            _buildStep(2, 'Select "Pay Bills" or "Lipa kwa M-Pesa".'),
            _buildStep(3, 'Enter Business Number: 123456.'),
            _buildStep(4, 'Enter Reference: EFATHA.'),
            _buildStep(5, 'Enter Amount and PIN.'),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderLogoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLogoPlaceholder('M-Pesa', Colors.red),
        _buildLogoPlaceholder('Tigo', Colors.blue),
        _buildLogoPlaceholder('Airtel', Colors.red.shade900),
      ],
    );
  }

  Widget _buildLogoPlaceholder(String name, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
          child: Center(child: Text(name[0], style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 24))),
        ),
        const SizedBox(height: 8),
        Text(name, style: GoogleFonts.outfit(fontSize: 12)),
      ],
    );
  }

  Widget _buildStep(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 12, backgroundColor: Colors.blue, child: Text('$number', style: const TextStyle(color: Colors.white, fontSize: 12))),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: GoogleFonts.outfit(fontSize: 14))),
        ],
      ),
    );
  }
}
