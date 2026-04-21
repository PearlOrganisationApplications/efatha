import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String selectedCategory;
  final VoidCallback? onTranslateTap;
  final VoidCallback? onSearchTap;
  final Function(String)? onCategorySelected;

  const CustomAppBar({
    super.key,
    this.userName = 'Gorge',
    this.selectedCategory = '',
    this.onTranslateTap,
    this.onSearchTap,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.tv, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Hello $userName',
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildIconButton(
                    icon: Icons.translate,
                    onPressed: onTranslateTap,
                  ),
                  const SizedBox(width: 8),
                  _buildIconButton(icon: Icons.search, onPressed: onSearchTap),
                ],
              ),
            ),
            const Divider(height: 1),
            _buildCategoryRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({required IconData icon, VoidCallback? onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: Colors.blue.shade800),
        onPressed: onPressed,
        constraints: const BoxConstraints(minWidth: 26, minHeight: 26),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildCategoryRow() {
    final categories = [
      'Giving',
      'Donate',
      'Mobile Payment',
      'Global Giving',
      'Wire Transfer',
      'Prayer',
      'Prayer Request',
      'Prayer Wall',
      'Salvation',
      'Partners',
      'Local Partner',
      'International Partner',
      'Contact'
    ];
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = categories[index] == selectedCategory;
          return Center(
            child: InkWell(
              onTap: () => onCategorySelected?.call(categories[index]),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.shade700 : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.blue.shade700 : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  categories[index],
                  style: GoogleFonts.outfit(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(115);
}
