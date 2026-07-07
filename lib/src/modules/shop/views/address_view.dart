import 'package:efatha_tv/app.back.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:efatha_tv/src/modules/shop/views/order_review_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: AppBackButton(),
        title: Text(
          'Add New Address',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildField('Name', 'wellie Jennings'),
            const SizedBox(height: 20),
            _buildField('Email Address', 'welliejennings@example.com'),
            const SizedBox(height: 20),
            _buildField('Phone Number', '(581) 633-9133'),
            const SizedBox(height: 20),
            _buildField('Address', '3891 Ranchview Dr. Richardson'),
            const SizedBox(height: 20),
            _buildField('City', 'California'),
            const SizedBox(height: 20),
            _buildField('Country', 'United State'),
            const SizedBox(height: 20),
            _buildField('Zip Code', '64667'),
            const SizedBox(height: 40),
            AppButton(
              padding: EdgeInsets.all(0),
              //width: double.infinity,
              radius: 40,

              onPressed: () => Get.to(() => const OrderReviewView()),

              title: "Add Address",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.outfit(color: Colors.black87),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
        ),
      ],
    );
  }
}
