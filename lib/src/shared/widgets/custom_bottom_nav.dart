import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _primaryBlue = Color(0xFF1A73E8);
  static const _inactiveGrey = Color(0xFF9E9E9E);
  static const _mediaAsset = 'assets/n3.png';

  static const double _circleRadius = 30.0; // circle size
  static const double _protrude = 30.0; // how high circle rises above bar
  static const double _barHeight = 70.0; // white bar height

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: _barHeight + _protrude,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // ── White bar with shallow notch ──
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: _NotchedBarPainter(
                circleRadius: _circleRadius + 8,
                notchDepth: 4,
              ),
              child: SizedBox(
                height: _barHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildNavItem(context, 0, 'assets/n1.png', 'Home'),
                    ),
                    Expanded(
                      child: _buildNavItem(
                        context,
                        1,
                        'assets/n2.png',
                        'About',
                      ),
                    ),

                    // ── Center slot: just "Media" label at bottom ──
                    SizedBox(
                      width: (_circleRadius + 8) * 2 + 16,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Media',
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              fontWeight: currentIndex == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: currentIndex == 2
                                  ? _primaryBlue
                                  : _inactiveGrey,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: _buildNavItem(
                        context,
                        3,
                        'assets/n4.png',
                        'E-Store',
                      ),
                    ),
                    Expanded(
                      child: _buildNavItem(
                        context,
                        4,
                        'assets/n5.png',
                        'Profile',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Circle button: floats above bar ──
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(2),
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: _circleRadius * 2,
                height: _circleRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: currentIndex == 2 ? _primaryBlue : Colors.white,
                    width: 2.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _primaryBlue.withValues(
                        alpha: currentIndex == 2 ? 0.30 : 0.12,
                      ),
                      blurRadius: 18,
                      offset: const Offset(0, 5),
                    ),
                    const BoxShadow(
                      color: Color(0x10000000),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    _mediaAsset,
                    width: 26,
                    height: 26,
                    color: currentIndex == 2
                        ? _primaryBlue
                        : const Color(0xFF546E7A),
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    String asset,
    String label,
  ) {
    final isActive = currentIndex == index;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth < 360 ? 20.0 : 22.0;
    final fontSize = screenWidth < 360 ? 10.0 : 11.0;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(12),
      splashColor: _primaryBlue.withValues(alpha: 0.08),
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              asset,
              width: iconSize,
              height: iconSize,
              color: isActive ? _primaryBlue : _inactiveGrey,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: fontSize,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? _primaryBlue : _inactiveGrey,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

/// White bar with a shallow smooth notch cut at the top-center.
class _NotchedBarPainter extends CustomPainter {
  final double circleRadius;
  final double notchDepth;

  const _NotchedBarPainter({
    required this.circleRadius,
    required this.notchDepth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Soft drop shadow
    canvas.drawPath(
      _buildPath(size),
      Paint()
        ..color = const Color(0x14000000)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10),
    );
    // White fill
    canvas.drawPath(
      _buildPath(size),
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  Path _buildPath(Size size) {
    final cx = size.width / 2;
    final r = circleRadius;
    const margin = 8.0;
    final left = cx - r - margin;
    final right = cx + r + margin;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(left - 16, 0)
      // Smooth entry curve into notch
      ..cubicTo(left - 4, 0, left, notchDepth * 0.35, left + margin, notchDepth)
      // Gentle arc across notch bottom
      ..arcToPoint(
        Offset(right - margin, notchDepth),
        radius: Radius.circular(r),
        clockwise: false,
      )
      // Smooth exit curve out of notch
      ..cubicTo(right, notchDepth * 0.35, right + 4, 0, right + 16, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldRepaint(_NotchedBarPainter old) =>
      old.circleRadius != circleRadius || old.notchDepth != notchDepth;
}
