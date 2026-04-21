import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/cart_controller.dart';

class OrderReviewView extends StatelessWidget {
  const OrderReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text('Order Review', style: GoogleFonts.outfit(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCartSummary(controller),
            const Divider(height: 48),
            _buildSectionHeader('Delivery Address', onEdit: () => Get.back()),
            const SizedBox(height: 12),
            Text('3715 Ash Dr. San Jose, South Dakota 83475', style: GoogleFonts.outfit(color: Colors.grey.shade600, fontSize: 13)),
            const Divider(height: 48),
            _buildSectionHeader('Payment Details', onEdit: () {}),
            const SizedBox(height: 12),
            _buildPaymentMethod(),
            const Divider(height: 48),
            Text('Order Summary', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPriceRow('Items Total', '\$${controller.subtotal.toStringAsFixed(2)}'),
            const SizedBox(height: 12),
            _buildPriceRow('Discount', '-\$${controller.discount.toStringAsFixed(2)}', valueColor: Colors.blue),
            const SizedBox(height: 12),
            _buildPriceRow('Delivery Charge', 'Free'),
            const Divider(height: 40),
            _buildPriceRow('Grand Total', '\$${controller.total.toStringAsFixed(2)}', isTotal: true),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showSuccessDialog(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Pay Now', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onEdit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onEdit, child: Text('Edit', style: GoogleFonts.outfit(color: Colors.blue))),
      ],
    );
  }

  Widget _buildCartSummary(CartController controller) {
    return Column(
      children: controller.cartItems.map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.book, size: 20, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.title, style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.bold)),
                  Text('Qty: ${item.quantity.value}', style: GoogleFonts.outfit(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
            Text(item.product.price!, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.credit_card, color: Colors.orange),
          const SizedBox(width: 12),
          Text('Master Card', style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text('**** 4543', style: GoogleFonts.outfit(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.outfit(fontSize: isTotal ? 16 : 13, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.grey.shade600)),
        Text(value, style: GoogleFonts.outfit(fontSize: isTotal ? 18 : 14, fontWeight: FontWeight.bold, color: valueColor ?? Colors.black)),
      ],
    );
  }

  void _showSuccessDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 24),
              Text('Order Placed!', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text(
                'Your order has been placed successfully. You can track it in your orders section.',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed('/dashboard'), // Assuming route name
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade600, foregroundColor: Colors.white),
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
