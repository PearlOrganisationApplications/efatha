import 'package:efatha_tv/src/modules/home/widgets/program_grid_item.dart';
import 'package:flutter/material.dart';

class HorizontalPagedGrid extends StatefulWidget {
  final List<dynamic> items; // replace with your actual type
  final int itemsPerRow;
  final int rowsPerPage;

  const HorizontalPagedGrid({
    super.key,
    required this.items,
    this.itemsPerRow = 6,
    this.rowsPerPage = 2,
  });

  @override
  State<HorizontalPagedGrid> createState() => _HorizontalPagedGridState();
}

class _HorizontalPagedGridState extends State<HorizontalPagedGrid> {
  late final PageController _pageController;
  int _currentPage = 0;

  int get _itemsPerPage => widget.itemsPerRow * widget.rowsPerPage;

  int get _totalPages => (widget.items.length / _itemsPerPage).ceil();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // height = 2 rows; adjust rowHeight to match your card
          height:
              _rowHeight(context) * widget.rowsPerPage +
              (10 * (widget.rowsPerPage - 1)), // mainAxisSpacing
          child: PageView.builder(
            controller: _pageController,
            itemCount: _totalPages,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemBuilder: (context, pageIndex) {
              final start = pageIndex * _itemsPerPage;
              final end = (start + _itemsPerPage).clamp(0, widget.items.length);
              final pageItems = widget.items.sublist(start, end);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pageItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.itemsPerRow,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) => ProgramGridItem(
                    program: pageItems[index],
                    index: start + index,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Page indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_totalPages, (i) {
            final isActive = i == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF1A73E8)
                    : const Color(0xFFD0D0D0),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

  // Calculates row height from screen width to match your childAspectRatio
  double _rowHeight(BuildContext context) {
    const spacing = 10.0;
    const hPadding = 32.0; // 16 * 2
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth =
        (screenWidth - hPadding - (spacing * (widget.itemsPerRow - 1))) /
        widget.itemsPerRow;
    return itemWidth / 0.72; // same as childAspectRatio
  }
}
