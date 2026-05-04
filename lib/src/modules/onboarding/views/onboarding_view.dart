import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:efatha_tv/src/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:efatha_tv/src/core/values/app_colors.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundNavy,
      body: Stack(
        children: [
          // Background Image with Gradient
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black26,
                    AppColors.backgroundNavy,
                  ],
                  stops: [0.0, 0.8],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/onboarding_hero.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          Column(
            children: [
              const Spacer(flex: 3),
              Expanded(
                flex: 4,
                child: PageView(
                  onPageChanged: controller.updateIndex,
                  children: [
                    _buildStep(
                      title: 'Listen to your favorite\npodcast anywhere.',
                      description: 'Always have your favorite podcasts at your fingertips, listening in high quality is easier.',
                    ),
                    _buildStep(
                      title: 'Real-Time Content\nMedia transformation.',
                      description: 'Stay updated with live broadcasts and news from Efatha TV directly on your mobile device.',
                    ),
                    _buildStep(
                      title: 'Secure Education\nand Resources.',
                      description: 'Access our store and educational resources with ease and security.',
                    ),
                  ],
                ),
              ),

              // Bottom Area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  children: [
                    // Indicator
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => _buildIndicator(index == controller.currentIndex.value),
                          ),
                        )),
                    const SizedBox(height: 48),

                    // Action Button
                    Obx(() => AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: controller.currentIndex.value == 2
                              ? ElevatedButton(
                                  key: const ValueKey('get_started'),
                                  onPressed: controller.completeOnboarding,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: AppColors.backgroundNavy,
                                    minimumSize: const Size(double.infinity, 56),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                )
                              : const SizedBox(height: 56),
                        )),
                    
                    const SizedBox(height: 24),
                    const Text(
                      'Free / Premium and Just For You',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
