import 'package:get/get.dart';

import '../controllers/index_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../shop/controllers/shop_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IndexController());

    // Ensure repositories are available
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<ShopController>(() => ShopController(Get.find()));
  }
}
