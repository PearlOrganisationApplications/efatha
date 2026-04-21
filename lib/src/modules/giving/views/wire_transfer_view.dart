import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WireTransferView extends StatelessWidget {
  const WireTransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WIRE TRANSFER', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                children: [
                  const Icon(Icons.account_balance, size: 50, color: Colors.blue),
                  const SizedBox(height: 16),
                  Text(
                    'BANKING DETAILS',
                    style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildDetailRow('BANK NAME', 'NATIONAL BANK OF COMMERCE (NBC)'),
            _buildDetailRow('ACCOUNT NAME', 'EFATHA TV MINISTRY'),
            _buildDetailRow('ACCOUNT NUMBER', '0123 4567 8901'),
            _buildDetailRow('SWIFT CODE', 'NBCCTZTZ'),
            _buildDetailRow('BRANCH', 'DAR ES SALAAM'),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                   const Icon(Icons.info_outline, color: Colors.grey),
                   const SizedBox(width: 12),
                   Expanded(
                     child: Text(
                       'Please share a screenshot of the transfer with us via the contact section for confirmation.',
                       style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey.shade600),
                     ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(value, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600))),
              const Icon(Icons.copy, size: 18, color: Colors.blue),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
