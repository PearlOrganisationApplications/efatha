import 'package:get/get.dart';
import '../../../data/models/wp_post.dart';
import '../../../data/models/wp_podcast.dart';
import '../../../data/repositories/content_repository.dart';

class HomeController extends GetxController {
  final ContentRepository _repository = Get.find<ContentRepository>();

  final posts = <WpPost>[].obs;
  final podcasts = <WpPodcast>[].obs;
  final programs = <WpPost>[].obs; // Using posts as programs for now
  final featuredPost = Rxn<WpPost>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchContent();
  }

  Future<void> fetchContent() async {
    isLoading.value = true;
    try {
      final fetchedPosts = await _repository.getPosts();
      final fetchedPodcasts = await _repository.getPodcasts();
      
      posts.assignAll(fetchedPosts);
      podcasts.assignAll(fetchedPodcasts);
      
      if (fetchedPosts.isNotEmpty) {
        featuredPost.value = fetchedPosts.first;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
