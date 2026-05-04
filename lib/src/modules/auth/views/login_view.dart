import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:efatha_tv/src/modules/auth/controllers/auth_controller.dart';
import 'package:efatha_tv/src/core/values/app_colors.dart';
import 'package:efatha_tv/src/shared/widgets/auth_widgets.dart';
import 'package:efatha_tv/src/routes/app_routes.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            // Logo
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 80,
              ),
            ),
            const SizedBox(height: 48),

            // Login Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: const Border(
                  top: BorderSide(color: AppColors.primary, width: 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign in now',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please login to continue using our app.',
                    style: TextStyle(fontSize: 14, color: AppColors.textSecondaryLight),
                  ),
                  const SizedBox(height: 32),

                  const AuthTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 24),

                  const AuthTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                      child: const Text('Forgot password?'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value ? null : controller.login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Sign in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      )),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.register),
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SocialAuthButton(
                label: 'Continue with Google',
                iconAsset: '',
                onTap: () {},
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
