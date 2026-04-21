import 'package:get/get.dart';

import '../../core/services/mock_data_service.dart';
import '../../core/utils/api_constants.dart';
import '../models/wp_post.dart';
import '../models/wp_podcast.dart';
import '../providers/base_provider.dart';

class ContentRepository extends GetxService {
  final BaseProvider _provider;
  final MockDataService _mockService = Get.find<MockDataService>();

  ContentRepository(this._provider);

  bool _isRealPost(Map<String, dynamic> json) {
    final title = json['title']?['rendered'] ?? '';
    return title.toString().trim().isNotEmpty;
  }

  Future<List<WpPost>> getPosts({int page = 1, int perPage = 20}) async {
    try {
      final response = await _provider.get(
        ApiConstants.posts,
        queryParameters: {'page': page, 'per_page': perPage, '_embed': ''},
      );

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> data = response.data;
        return data
            .where((json) => _isRealPost(json as Map<String, dynamic>))
            .map((json) => WpPost.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      // Fallback to Mock Data
      final mockData = await _mockService.loadList(
        'home_data.json',
        'programs',
      );
      return mockData
          .map(
            (json) => WpPost.fromJson({
              'id': json['id'],
              'title': {'rendered': json['title']},
              'excerpt': {'rendered': json['host']},
              'featured_media_url':
                  'https://placehold.co/400x300/blue/white/png?text=${json['title']}',
              'guid': {'rendered': 'https://efathatv.com/mock/${json['id']}'},
            }),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<WpPodcast>> getPodcasts({int page = 1, int perPage = 20}) async {
    try {
      final response = await _provider.get(
        ApiConstants.podcasts,
        queryParameters: {'page': page, 'per_page': perPage},
      );

      if (response.statusCode == 200 && response.data is List) {
        final List<dynamic> data = response.data;
        return data
            .where((json) {
              final meta = (json as Map<String, dynamic>)['meta'] ?? {};
              final audioFile = (meta['audio_file'] as String? ?? '').trim();
              return audioFile.isNotEmpty;
            })
            .map((json) => WpPodcast.fromJson(json as Map<String, dynamic>))
            .toList();
      }

      // Fallback to Mock Data
      final mockData = await _mockService.loadList(
        'media_data.json',
        'podcasts',
      );
      return mockData
          .map(
            (json) => WpPodcast.fromJson({
              'id': json['id'],
              'title': {'rendered': json['title']},
              'author': json['author'],
              'duration': json['duration'],
              'audio_url': 'https://efathatv.com/mock.mp3',
            }),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }
}
