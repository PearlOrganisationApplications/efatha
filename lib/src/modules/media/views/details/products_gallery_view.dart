import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/shop_view.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProductsGalleryView extends StatelessWidget {
  ProductsGalleryView({super.key});
  final controller = Get.find<IndexController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        AppText(title: "Products", fontSize: 14, fontWeight: FontWeight.w700),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(24),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => ShopView());
                },
                child: _buildCategoryCard(
                  'BOOKS',
                  "assets/b1.png",
                  Colors.blue.shade900,
                ),
              ),
              _buildCategoryCard(
                'Audio',
                "assets/b2.png",
                Colors.orange.shade800,
              ),
              _buildCategoryCard('VOD', "assets/b3.png", Colors.red.shade800),
              _buildCategoryCard(
                'EFATHA PRODUCTS',
                "assets/b1.png",
                Colors.teal.shade700,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),

          SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
