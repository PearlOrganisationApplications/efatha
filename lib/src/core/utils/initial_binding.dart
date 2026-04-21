import 'package:get/get.dart';
import '../../data/providers/base_provider.dart';
import '../../data/repositories/content_repository.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../modules/shop/controllers/cart_controller.dart';
import '../services/mock_data_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Inject global services
    Get.put(MockDataService(), permanent: true);
    final baseProvider = Get.put<BaseProvider>(BaseProvider(), permanent: true);
    Get.put<ContentRepository>(ContentRepository(baseProvider), permanent: true);
    Get.put<ProductRepository>(ProductRepository(baseProvider), permanent: true);
    Get.put<PortfolioRepository>(PortfolioRepository(baseProvider), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
