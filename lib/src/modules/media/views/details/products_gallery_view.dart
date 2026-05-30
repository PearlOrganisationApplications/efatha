import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsGalleryView extends StatelessWidget {
  const ProductsGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.9,
        children: [
          _buildCategoryCard('Bibles', "assets/b1.png", Colors.blue.shade900),
          _buildCategoryCard('Audio', "assets/b2.png", Colors.orange.shade800),
          _buildCategoryCard('DVD', "assets/b3.png", Colors.red.shade800),
          _buildCategoryCard(
            'EFATHA PRODUCTS',
            "assets/b1.png",
            Colors.teal.shade700,
          ),
        ],
      ),
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
