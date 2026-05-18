import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final _storage = GetStorage();
  final currentIndex = 0.obs;

  void updateIndex(int index) => currentIndex.value = index;

  void completeOnboarding() {
    _storage.write('isFirstTime', false);
    Get.offAllNamed(AppRoutes.dashboard);
  }
}
