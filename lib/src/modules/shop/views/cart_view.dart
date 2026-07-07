import 'package:cached_network_image/cached_network_image.dart';
import 'package:efatha_tv/app.back.dart';
import 'package:efatha_tv/src/core/values/app_colors.dart';
import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:efatha_tv/src/shared/widgets/custom_text_field.dart';
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
        leading: AppBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.cartItems.isEmpty
            ? _buildEmptyCart()
            : Column(
                children: [
                  Expanded(child: _buildCartList(controller)),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AppTextField(
                      label: "Enter Promo Code",
                      hint: "Enter Promo Code",
                    ),
                  ),

                  _buildPriceSummary(controller),
                ],
              ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_basket_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 24),
          Text(
            'Your cart is empty',
            style: GoogleFonts.outfit(fontSize: 18, color: Colors.grey),
          ),
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
        return Container(
          child: Row(
            crossAxisAlignment: .start,
            mainAxisAlignment: .start,
            children: [
              CachedNetworkImage(
                height: 128,
                width: 102,
                imageUrl:
                    "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTM9xdB98PYmyJqSrvPnPEXiTSP8EcPLHG3jNb2JnxWk7pC3m45rdmkT4v95gLn5oR0R86GixS1qPWjjdR2Lo5g_Irqw_Baa4JiPlZZx17Wy5py5BnN01IZgAs",
              ),

              Column(
                spacing: 4,
                crossAxisAlignment: .start,
                children: [
                  AppText(title: "By Adam Smith"),

                  AppText(title: "Stillwell Long Island", fontWeight: .bold),
                  AppText(title: "\$120.00"),
                  const SizedBox(width: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      circleButton(
                        colorIcon: Colors.black,
                        color: Colors.white,
                        icon: Icons.remove,
                        onTap: () {
                          // Minus action
                        },
                      ),
                      const SizedBox(width: 12),
                      AppText(title: "2"),
                      const SizedBox(width: 12),
                      circleButton(
                        colorIcon: Colors.white,
                        color: AppColors.appcolor,
                        icon: Icons.add,
                        onTap: () {
                          // Plus action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQtyBtn(
    IconData icon,
    VoidCallback onTap, {
    bool isPrimary = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isPrimary ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isPrimary ? Colors.blue : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          size: 16,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildPriceSummary(CartController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _buildPriceRow(
            'Items Total',
            '\$${controller.subtotal.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 12),
          _buildPriceRow(
            'Discount',
            '-\$${controller.discount.toStringAsFixed(2)}',
            valueColor: Colors.blue,
          ),
          const Divider(height: 32),
          _buildPriceRow(
            'Grand Total',
            '\$${controller.total.toStringAsFixed(2)}',
            isTotal: true,
          ),
          const SizedBox(height: 24),

          AppButton(
            padding: EdgeInsets.all(0),
            radius: 40,
            onPressed: () {
              Get.to(() => AddressView());
            },
            title: "Proceed to Checkout",
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isTotal = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }

  Widget circleButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    required Color colorIcon,
  }) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      elevation: 2,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Icon(icon, size: 22, color: colorIcon),
        ),
      ),
    );
  }
}
