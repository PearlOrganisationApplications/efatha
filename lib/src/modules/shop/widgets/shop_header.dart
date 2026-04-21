import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../views/cart_view.dart';

class ShopHeader extends StatelessWidget {
  final CartController cartController;

  const ShopHeader({super.key, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Gorge!',
                style: GoogleFonts.outfit(fontSize: 14, color: Colors.grey.shade600),
              ),
              Text(
                'Keep Exploring',
                style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () => Get.to(() => const CartView()),
                icon: const Icon(Icons.shopping_basket_outlined, size: 28),
              ),
              Obx(() => cartController.cartItems.isNotEmpty
                  ? Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                        child: Text(
                          '${cartController.cartItems.length}',
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
            ],
          ),
        ],
      ),
    );
  }
}
