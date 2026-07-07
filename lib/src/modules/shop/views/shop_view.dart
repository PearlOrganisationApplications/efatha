import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/cart_controller.dart';
import '../widgets/shop_header.dart';
import '../widgets/shop_hero_carousel.dart';
import '../widgets/product_grid_item.dart';
import 'shop_search_view.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the global cart controller
    final CartController cartController = Get.find<CartController>();

    final categories = ['Fiction', 'Drama', 'Fiction', 'Art', 'History'];
    final featuredBook = {
      'title': 'The Glamour History - Hannibal Adofo',
      'pages': '450',
      'progress': '82%',
    };
    final products = [
      {
        'title':
            'The Morac dsadddddddddddifhasofasnofhsaohffffffffffffffffffffffffffffffffffffffBook 1',
        'author': 'By Adam Smith',
        'price': '125.00',
        'old_price': '145.00',
      },
      {
        'title': 'Elvenwood Forest',
        'author': 'By Christopher Henry',
        'price': '75.00',
        'old_price': '95.00',
      },
      {
        'title': 'Stillwell Long Island',
        'author': 'By Adam Smith',
        'price': '115.00',
        'old_price': '125.00',
      },
      {
        'title': 'Warmage Book 2',
        'author': 'By Terry Mansuur',
        'price': '85.50',
        'old_price': '90.00',
      },
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 10),
            ShopHeader(cartController: cartController),
            _buildSearchAnchor(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ShopHeroCarousel(featuredBook: featuredBook),
                    _buildCategoryFilters(categories),
                    _buildProductGrid(products),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAnchor() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: () => Get.to(() => const ShopSearchView()),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 12),
              Text(
                'Search your favorite book',
                style: GoogleFonts.outfit(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters(List<String> categories) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade700 : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey.shade200,
              ),
            ),
            child: Text(
              categories[index],
              style: GoogleFonts.outfit(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid(List<Map<String, dynamic>> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductGridItem(product: products[index], index: index + 1);
      },
    );
  }
}
