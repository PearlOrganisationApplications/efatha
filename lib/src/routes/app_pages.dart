import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/media/views/details/live_stream_view.dart';
import '../modules/about/views/about_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/index/views/index_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/media/views/media_view.dart';
import '../modules/giving/views/donate_view.dart';
import 'package:efatha_tv/src/modules/auth/bindings/auth_binding.dart';
import 'package:efatha_tv/src/modules/auth/views/login_view.dart';
import 'package:efatha_tv/src/modules/auth/views/register_view.dart';
import 'package:efatha_tv/src/modules/auth/views/forgot_password_view.dart';
import 'package:efatha_tv/src/modules/auth/views/otp_view.dart';
import '../../splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.register;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      bindings: [IndexBinding(), HomeBinding(), ShopBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.shop,
      page: () => const ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(name: AppRoutes.media, page: () => const MediaView()),
    GetPage(name: AppRoutes.about, page: () => const AboutView()),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.donate, page: () => const DonateView()),
    GetPage(name: AppRoutes.live, page: () => const LiveStreamView()),
  ];
}
