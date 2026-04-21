import 'package:get/get.dart';
import '../../../data/models/product.dart';
import '../../../data/repositories/product_repository.dart';

class ShopController extends GetxController {
  final ProductRepository _repository;

  ShopController(this._repository);

  final products = <Product>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final fetchedProducts = await _repository.getProducts();
      products.assignAll(fetchedProducts);
    } finally {
      isLoading.value = false;
    }
  }
}
