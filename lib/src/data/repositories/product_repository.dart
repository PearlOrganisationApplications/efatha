import '../../core/utils/api_constants.dart';
import '../models/product.dart';
import '../providers/base_provider.dart';

class ProductRepository {
  final BaseProvider _provider;

  ProductRepository(this._provider);

  Future<List<Product>> getProducts({int page = 1, int perPage = 10}) async {
    try {
      final response = await _provider.get(
        ApiConstants.products,
        queryParameters: {
          'page': page,
          'per_page': perPage,
          '_embed': '',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
