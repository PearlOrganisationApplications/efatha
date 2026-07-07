import 'package:efatha_tv/src/core/utils/initial_binding.dart';
import 'package:efatha_tv/src/modules/auth/controllers/auth_controller.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';
import 'package:efatha_tv/src/routes/app_routes.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:media_kit/media_kit.dart';

import 'src/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // ✅ Permanent Controller
  Get.put(AuthController(), permanent: true);
  Get.put(IndexController(), permanent: true);

  // ✅ Permanent Controller
  Get.put(AuthController(), permanent: true);
  MediaKit.ensureInitialized(); // ✅ Zaroori hai
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: 'Efatha TV',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),

      // home: SplashScreem(),
      // home: const WebViewScreen(),
    );
  }
}
