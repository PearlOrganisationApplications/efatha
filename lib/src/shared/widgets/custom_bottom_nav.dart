import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _primaryBlue = Color(0xFF04A3DA);
  final controller = Get.find<IndexController>();
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      // ✅ Always locked to 2 — curve never moves
      index: 2,
      // ✅ Block package's internal index change; we handle it ourselves
      letIndexChange: (index) {
        controller.changeIndex(index);

        return false;
      },
      onTap: (i) {},
      iconPadding: 0,
      height: 70,
      //maxWidth: 22,
      color: Colors.white,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.transparent,
      animationCurve: Curves.easeOutCubic,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        CurvedNavigationBarItem(
          child: _navIcon(asset: 'assets/n1.png', isActive: currentIndex == 0),
          label: 'Home',
          labelStyle: _labelStyle(isActive: currentIndex == 0),
        ),
        CurvedNavigationBarItem(
          child: _navIcon(asset: 'assets/n2.png', isActive: currentIndex == 1),
          label: 'About',
          labelStyle: _labelStyle(isActive: currentIndex == 1),
        ),
        CurvedNavigationBarItem(
          child: _mediaCircle(isActive: currentIndex == 2),
          label: 'Media',
          labelStyle: _labelStyle(isActive: currentIndex == 2),
        ),
        CurvedNavigationBarItem(
          child: _navIcon(asset: 'assets/n4.png', isActive: currentIndex == 3),
          label: 'E-Store',
          labelStyle: _labelStyle(isActive: currentIndex == 3),
        ),
        CurvedNavigationBarItem(
          child: _navIcon(asset: 'assets/n5.png', isActive: currentIndex == 4),
          label: 'Profile',
          labelStyle: _labelStyle(isActive: currentIndex == 4),
        ),
      ],
    );
  }

  static TextStyle _labelStyle({required bool isActive}) {
    return GoogleFonts.outfit(
      fontSize: 10.5,
      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
      color: isActive ? _primaryBlue : Colors.black54,
    );
  }

  static Widget _navIcon({required String asset, required bool isActive}) {
    return Image.asset(
      asset,
      width: 22,
      height: 22,
      color: isActive ? _primaryBlue : Colors.black54,
      colorBlendMode: BlendMode.srcIn,
    );
  }

  static Widget _mediaCircle({required bool isActive}) {
    return Transform.translate(
      offset: const Offset(0, 8), // adjust value
      child: Container(
        width: 56,
        height: 56,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: _primaryBlue, width: 2.5),
          boxShadow: [
            BoxShadow(
              color: _primaryBlue.withOpacity(isActive ? 0.25 : 0.10),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            'assets/n3.png',
            width: 25,
            height: 25,
            color: _primaryBlue,
            colorBlendMode: BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
