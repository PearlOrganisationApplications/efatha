import '../../core/utils/api_constants.dart';
import '../models/portfolio.dart';
import '../providers/base_provider.dart';

class PortfolioRepository {
  final BaseProvider _provider;

  PortfolioRepository(this._provider);

  Future<List<Portfolio>> getPortfolios({int page = 1, int perPage = 10}) async {
    try {
      final response = await _provider.get(
        ApiConstants.portfolio,
        queryParameters: {
          'page': page,
          'per_page': perPage,
          '_embed': '',
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Portfolio.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
