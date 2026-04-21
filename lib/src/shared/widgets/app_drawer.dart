import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor.withValues(alpha: 0.8)],
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EfathaTV', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Media for Transformation', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () => Get.offAllNamed(AppRoutes.index)),
          _buildDrawerItem(Icons.live_tv, 'Live Stream', () => Get.toNamed(AppRoutes.live)),
          _buildDrawerItem(Icons.shopping_bag, 'eShop', () => Get.toNamed(AppRoutes.shop)),
          _buildDrawerItem(Icons.movie, 'Videos & Media', () => Get.toNamed(AppRoutes.media)),
          _buildDrawerItem(Icons.work, 'Portfolio', () => Get.toNamed(AppRoutes.portfolio)),
          _buildDrawerItem(Icons.favorite, 'Donate', () => Get.toNamed(AppRoutes.donate)),
          const Divider(),
          _buildDrawerItem(Icons.info, 'About Us', () => Get.toNamed(AppRoutes.about)),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Get.back(); // Close drawer
        onTap();
      },
    );
  }
}
