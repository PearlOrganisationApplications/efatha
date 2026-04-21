import 'package:get/get.dart';

class IndexController extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final selectedCategory = ''.obs;

  void changeIndex(int index) {
    _currentIndex.value = index;
    // Clear category highlight when switching main tabs if desired
    // selectedCategory.value = ''; 
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
  }
}
