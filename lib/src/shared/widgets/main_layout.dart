import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../core/values/app_strings.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EfathaTV'),
        elevation: 0,
      ),
      drawer: Drawer(
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
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Get.offAllNamed(AppRoutes.home),
            ),
            ListTile(
              leading: const Icon(Icons.live_tv_outlined),
              title: const Text(AppStrings.liveTv),
              onTap: () => Get.toNamed(AppRoutes.live),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text(AppStrings.recentPosts), // Reusing or adding 'Store'
              onTap: () => Get.toNamed(AppRoutes.shop),
            ),
            ListTile(
              leading: const Icon(Icons.work_outline),
              title: const Text('Portfolio'),
              onTap: () => Get.toNamed(AppRoutes.portfolio),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text(AppStrings.aboutUs),
              onTap: () => Get.toNamed(AppRoutes.about),
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
