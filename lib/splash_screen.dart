import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:efatha_tv/src/routes/app_routes.dart';
import 'package:efatha_tv/src/core/values/app_colors.dart';
import 'package:efatha_tv/src/data/providers/base_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _storage = GetStorage();

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    // Check connectivity/baseUrl
    try {
      final baseProvider = Get.find<BaseProvider>();
      await baseProvider.get(''); // Simple check to the base URL
    } catch (e) {
      // Ignore errors for now, but in a real app we might show a retry screen
    }

    // Check if onboarding is needed
    final bool isFirstTime = _storage.read('isFirstTime') ?? true;
    
    // Add a minimum delay for branding visibility
    await Future.delayed(const Duration(seconds: 2));

    if (isFirstTime) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 120),
            const SizedBox(height: 24),
            const Text(
              'EFATHA TV',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            const SizedBox(height: 8),
            const Text(
              'Media for Transformation',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 80),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
