import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/modules/auth/controllers/auth_controller.dart';
import 'package:project/src/core/values/app_colors.dart';
import 'package:project/src/shared/widgets/auth_widgets.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 80,
              ),
            ),
            const SizedBox(height: 32),

            // Register Card
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
                    'Sign Up Now',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please fill the details and create a new account.',
                    style: TextStyle(fontSize: 14, color: AppColors.textSecondaryLight),
                  ),
                  const SizedBox(height: 32),

                  const AuthTextField(
                    label: 'Name',
                    hint: 'Enter your name',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 24),

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
                  const SizedBox(height: 32),

                  Obx(() => ElevatedButton(
                        onPressed: controller.isLoading.value ? null : controller.register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      )),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Log in'),
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
