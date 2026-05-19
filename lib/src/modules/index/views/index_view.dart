import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../giving/views/donate_view.dart';
import '../controllers/index_controller.dart';
import '../../home/views/home_view.dart';
import '../../shop/views/shop_view.dart';
import '../../media/views/media_view.dart';
import '../../../shared/widgets/app_drawer.dart';

class IndexView extends StatelessWidget {
  IndexController controller = Get.put(IndexController());
  IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeView(),
      const ShopView(),
      MediaView(),
      const DonateView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('EfathaTV'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Obx(
        () => IndexedStack(index: controller.currentIndex, children: screens),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'eShop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill),
              label: 'Media',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Donate',
            ),
          ],
        ),
      ),
    );
  }
}
