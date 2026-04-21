import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopSearchView extends StatelessWidget {
  const ShopSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: GoogleFonts.outfit(color: Colors.grey),
            border: InputBorder.none,
          ),
          style: GoogleFonts.outfit(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.grey),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Recent Search'),
            const SizedBox(height: 16),
            _buildRecentSearches(),
            const SizedBox(height: 32),
            _buildSectionHeader('Popular Books'),
            const SizedBox(height: 16),
            _buildPopularBooks(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRecentSearches() {
    final searches = [
      'The Morac Book 1',
      'Elvenwood Forest',
      'Stillwell Long Island',
    ];
    return Column(
      children: searches
          .map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  const Icon(Icons.history, color: Colors.grey, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      s,
                      style: GoogleFonts.outfit(color: Colors.grey.shade600),
                    ),
                  ),
                  const Icon(Icons.close, color: Colors.grey, size: 20),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPopularBooks() {
    final books = [
      {
        'title': 'Stillwell Long Island',
        'author': 'By Adam Smith',
        'price': '115.00',
        'oldPrice': '125.00',
      },
      {
        'title': 'Warmage Book 2',
        'author': 'By Terry Mansuur',
        'price': '85.50',
        'oldPrice': '90.00',
      },
    ];

    return Column(
      children: books
          .map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(Icons.book, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          b['author']!,
                          style: GoogleFonts.outfit(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          b['title']!,
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              b['price']!,
                              style: GoogleFonts.outfit(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              b['oldPrice']!,
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
