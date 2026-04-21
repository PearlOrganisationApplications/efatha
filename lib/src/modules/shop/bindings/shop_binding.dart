import 'package:get/get.dart';
import '../../../data/repositories/product_repository.dart';
import '../controllers/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopController>(
      () => ShopController(Get.find<ProductRepository>()),
    );
  }
}
