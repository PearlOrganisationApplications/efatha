import 'package:get/get.dart';
import 'package:efatha_tv/src/routes/app_routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  
  // Form controllers (simulated)
  final email = ''.obs;
  final password = ''.obs;
  final name = ''.obs;
  final otp = ''.obs;

  void login() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.index);
  }

  void register() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.toNamed(AppRoutes.otp);
  }

  void verifyOtp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.offAllNamed(AppRoutes.index);
  }

  void forgotPassword() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    // Show success dialog or navigate
    Get.snackbar('Success', 'Password reset link sent to your email');
  }
}
