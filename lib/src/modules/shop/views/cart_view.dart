import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/cart_controller.dart';
import 'address_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text('My Cart', style: GoogleFonts.outfit(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Obx(() => controller.cartItems.isEmpty 
        ? _buildEmptyCart() 
        : Column(
            children: [
              Expanded(child: _buildCartList(controller)),
              _buildPriceSummary(controller),
            ],
          )),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 24),
          Text('Your cart is empty', style: GoogleFonts.outfit(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCartList(CartController controller) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: controller.cartItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final item = controller.cartItems[index];
        return Row(
          children: [
            Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.book, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('By Adam Smith', style: GoogleFonts.outfit(fontSize: 10, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(item.product.title, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(item.product.price!, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            ),
            Row(
              children: [
                _buildQtyBtn(Icons.remove, () => controller.decrementQuantity(item.product.id)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Obx(() => Text('${item.quantity.value}', style: GoogleFonts.outfit(fontWeight: FontWeight.bold))),
                ),
                _buildQtyBtn(Icons.add, () => controller.incrementQuantity(item.product.id), isPrimary: true),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap, {bool isPrimary = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isPrimary ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: isPrimary ? Colors.blue : Colors.grey.shade300),
        ),
        child: Icon(icon, size: 16, color: isPrimary ? Colors.white : Colors.black),
      ),
    );
  }

  Widget _buildPriceSummary(CartController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, -5))],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          _buildPriceRow('Items Total', '\$${controller.subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          _buildPriceRow('Discount', '-\$${controller.discount.toStringAsFixed(2)}', valueColor: Colors.blue),
          const Divider(height: 32),
          _buildPriceRow('Grand Total', '\$${controller.total.toStringAsFixed(2)}', isTotal: true),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const AddressView()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Proceed to Checkout', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.outfit(fontSize: isTotal ? 16 : 14, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.grey.shade600)),
        Text(value, style: GoogleFonts.outfit(fontSize: isTotal ? 18 : 14, fontWeight: FontWeight.bold, color: valueColor ?? Colors.black)),
      ],
    );
  }
}
