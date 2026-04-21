import 'package:get/get.dart';
import '../controllers/index_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../shop/controllers/shop_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
    
    // Ensure repositories are available (already in InitialBinding, but for clarity)
    // We register the controllers here so Dashboard can find them immediately
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ShopController>(() => ShopController(Get.find()));
  }
}
