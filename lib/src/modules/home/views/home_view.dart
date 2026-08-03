import 'package:efatha_tv/chagne.lang.dart';
import 'package:efatha_tv/foteer.dart';
import 'package:efatha_tv/src/modules/dashboard/views/dashboard_view.dart';
import 'package:efatha_tv/src/modules/home/widgets/highlight_card.dart';
import 'package:efatha_tv/src/modules/media/views/video.dart';
import 'package:efatha_tv/src/modules/shop/views/app.text.dart';
import 'package:efatha_tv/src/modules/shop/views/btw.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home_controller.dart';
import '../widgets/program_grid_item.dart';
import '../../giving/views/giving_hub_view.dart';
import '../../giving/views/donate_view.dart';
import '../../giving/views/mobile_payment_view.dart';
import '../../giving/views/global_giving_view.dart';
import '../../giving/views/wire_transfer_view.dart';
import '../../prayer/views/prayer_hub_view.dart';
import '../../prayer/views/prayer_request_view.dart';
import '../../prayer/views/prayer_wall_view.dart';
import '../../prayer/views/salvation_view.dart';
import '../../partners/views/partners_view.dart';
import '../../partners/views/local_partner_view.dart';
import '../../partners/views/international_partner_view.dart';
import '../../contact/views/contact_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  HomeView({super.key});
  final ScrollController _programScrollController = ScrollController();
  @override
  void dispose() {
    _programScrollController.dispose();
    _programScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value && controller.posts.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      final mockPrograms = [
        {'title': 'Hello World', 'image': 'assets/images/home1.png'},
        {'title': 'Safari ya imani', 'image': 'assets/images/home2.png'},
        {'title': 'Kids Smile', 'image': 'assets/images/home3.png'},
        {'title': 'Nuru ya Ulimwengu', 'image': 'assets/images/home4.png'},
        {'title': 'Mkate wa Uzima', 'image': 'assets/images/home5.png'},
        {'title': 'Mtembeo wa Mwanamke', 'image': 'assets/images/home6.png'},
        {'title': 'Domy', 'image': 'assets/images/home7.png'},
        {'title': 'How I Met Jesus', 'image': 'assets/images/home8.png'},
        {'title': 'Praise and Worship', 'image': 'assets/images/home9.png'},
        {'title': 'Testimonial', 'image': 'assets/images/home10.png'},
        {'title': 'Apostolic Crusade', 'image': 'assets/images/home11.png'},
        {'title': 'Documentary', 'image': 'assets/images/home12.png'},
      ];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: .center,
              children: [
                Gap(20),
                Expanded(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScrollShrinkingGap(
                          scrollController: controller.scrollController,
                        ),
                        // _buildCategoryRow(),
                        Container(
                          height: 230,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            gradient: const LinearGradient(
                              colors: [Color(0xff1E1B72), Color(0xff2A287E)],
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  /// Left Side
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Text(
                                            "LIVE",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 10),
                                        ReqAppText(
                                          textAlign: .start,
                                          title: "Spreading God's Word,",
                                          fontSize: 20,
                                          fontSize2: 20,
                                          fontWeight1: FontWeight.bold,
                                          fontWeight2: FontWeight.bold,
                                          color1: Colors.white,
                                          color2: Colors.yellow,
                                          title2: "Transforming Lives Globally",
                                        ),
                                        Gap(7),
                                        SizedBox(
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AppButton(
                                                  color: Colors.yellow,
                                                  padding: EdgeInsets.all(0),
                                                  title: "Watch Live",
                                                  fontSize: 12,
                                                  textColor: Colors.black38,
                                                  onPressed: () {},
                                                ),
                                              ),
                                              Gap(15),
                                              Expanded(
                                                child: AppButton(
                                                  borderColor: Colors.white,
                                                  color: Colors.transparent,
                                                  padding: EdgeInsets.all(0),
                                                  title: "View Schedule",
                                                  fontSize: 10,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 20),

                                  /// Right Side (Video Player)
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        //borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.black26,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: CastrPlayerScreen(),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      AppText(
                                        title: "1+",
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      AppText(
                                        title: "COUNTRIES",
                                        color: Color(0xff8793CD),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      AppText(
                                        title: "13K+",
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      AppText(
                                        title: "CITIES",
                                        color: Color(0xff8793CD),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      AppText(
                                        title: "9K+",
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      AppText(
                                        title: "LANGUAGES",
                                        color: Color(0xff8793CD),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gap(12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            spacing: 3,
                            children: [
                              Expanded(
                                child: ProgramCard(
                                  title: 'tv_programs'.tr,
                                  icon: "assets/images/icon1.png",
                                ),
                              ),

                              Expanded(
                                child: ProgramCard(
                                  title: 'on_demand'.tr,
                                  icon: "assets/images/icon2.png",
                                ),
                              ),

                              Expanded(
                                child: ProgramCard(
                                  title: 'broadcast_schedule'.tr,
                                  icon: "assets/images/icon3.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                "Our Programs",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text("View All", style: TextStyle()),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 250,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                const spacing = 16.0;
                                final cardWidth =
                                    (constraints.maxWidth - spacing) / 2;

                                final List<List<int>> columns = [];
                                for (
                                  int i = 0;
                                  i < mockPrograms.length;
                                  i += 2
                                ) {
                                  columns.add([
                                    i,
                                    if (i + 1 < mockPrograms.length) i + 1,
                                  ]);
                                }

                                final viewportFraction =
                                    (cardWidth + spacing) /
                                    constraints.maxWidth;

                                return CarouselSlider.builder(
                                  itemCount: columns.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final colIndices = columns[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        right: spacing,
                                      ),
                                      child: SizedBox(
                                        width: cardWidth,
                                        child: Column(
                                          children: [
                                            for (
                                              int i = 0;
                                              i < colIndices.length;
                                              i++
                                            ) ...[
                                              Expanded(
                                                child: ProgramGridItem(
                                                  program:
                                                      mockPrograms[colIndices[i]],
                                                  index: colIndices[i],
                                                ),
                                              ),
                                              if (i != colIndices.length - 1)
                                                const SizedBox(height: 12),
                                            ],
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 250,
                                    viewportFraction: viewportFraction,
                                    padEnds: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(
                                      seconds: 2,
                                    ),
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 3,
                                    ),
                                    autoPlayCurve: Curves.easeInOutCubic,
                                    enlargeCenterPage: false,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                "Event Highlights",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text("View All", style: TextStyle()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 250,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                const spacing = 12.0;

                                final cardWidth =
                                    (constraints.maxWidth - (spacing * 2)) / 3;

                                final List<List<int>> pages = [];
                                for (
                                  int i = 0;
                                  i < mockPrograms.length;
                                  i += 6
                                ) {
                                  pages.add([
                                    for (
                                      int j = i;
                                      j < i + 6 && j < mockPrograms.length;
                                      j++
                                    )
                                      j,
                                  ]);
                                }

                                return CarouselSlider.builder(
                                  itemCount: pages.length,
                                  itemBuilder: (context, index, realIndex) {
                                    final pageIndices = pages[index];

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: pageIndices.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: spacing,
                                            mainAxisSpacing: spacing,
                                            childAspectRatio:
                                                cardWidth /
                                                ((250 - spacing) / 2),
                                          ),
                                      itemBuilder: (context, i) {
                                        final programIndex = pageIndices[i];
                                        return HighLightCardItem(
                                          program: mockPrograms[programIndex],
                                          index: programIndex,
                                        );
                                      },
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 250,
                                    viewportFraction: 1.0,
                                    padEnds: false,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(
                                      seconds: 3,
                                    ),
                                    autoPlayAnimationDuration: const Duration(
                                      milliseconds: 500,
                                    ),
                                    autoPlayCurve: Curves.easeInOutCubic,
                                    enlargeCenterPage: false,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        CustomFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PinnedTopBar(controller: controller),
          ],
        ),
      );
    });
  }

  Widget _buildCategoryRow() {
    final controller = Get.find<HomeController>();

    final categories = [
      'Giving',
      'Donate',
      'Mobile Payment',
      'Global Giving',
      'Wire Transfer',
      'Prayer',
      'Prayer Request',
      'Prayer Wall',
      'Salvation',
      'Partners',
      'Local Partner',
      'International Partner',
      'Contact',
    ];

    return Obx(
      () => SizedBox(
        height: 48,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return Center(
              child: InkWell(
                onTap: () {
                  _handleCategoryNavigation(categories[index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(
                    categories[index],
                    style: GoogleFonts.outfit(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showArrows = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showArrows)
            Icon(
              Icons.arrow_circle_left,
              color: Colors.blue.shade400,
              size: 28,
            ),
          if (showArrows) const Spacer(),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Colors.black87,
            ),
          ),
          if (showArrows) const Spacer(),
          if (showArrows)
            Icon(
              Icons.arrow_circle_right,
              color: Colors.blue.shade400,
              size: 28,
            ),
        ],
      ),
    );
  }

  Widget _buildEventHighlights() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildHighlightCardContent(),
          Positioned(
            left: -15,
            child: Icon(
              Icons.arrow_circle_left,
              color: Colors.blue.shade400,
              size: 28,
            ),
          ),
          Positioned(
            right: -15,
            child: Icon(
              Icons.arrow_circle_right,
              color: Colors.blue.shade400,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'KUSANYIKO',
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade400,
            letterSpacing: 2,
          ),
        ),
        Text(
          '2024',
          style: GoogleFonts.outfit(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: Colors.orange.shade400,
            height: 0.8,
          ),
        ),
        Text(
          'NAMPO YA IMANI',
          style: GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingSkeleton(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  void _handleCategoryNavigation(String category) {
    switch (category) {
      case 'Giving':
        Get.to(() => GivingHubView());
        break;
      case 'Donate':
        Get.to(() => DonateView());
        break;
      case 'Mobile Payment':
        Get.to(() => MobilePaymentView());
        break;
      case 'Global Giving':
        Get.to(() => GlobalGivingView());
        break;
      case 'Wire Transfer':
        Get.to(() => WireTransferView());
        break;
      case 'Prayer':
        Get.to(() => PrayerHubView());
        break;
      case 'Prayer Request':
        Get.to(() => PrayerRequestView());
        break;
      case 'Prayer Wall':
        Get.to(() => const PrayerWallView());
        break;
      case 'Salvation':
        Get.to(() => SalvationView());
        break;
      case 'Partners':
        Get.to(() => PartnersHubView());
        break;
      case 'Local Partner':
        Get.to(() => const LocalPartnerView());
        break;
      case 'International Partner':
        Get.to(() => const InternationalPartnerView());
        break;
      case 'Contact':
        Get.to(() => const ContactView());
        break;
    }
  }
}

class ProgramCard extends StatelessWidget {
  final String title;
  final String icon;

  const ProgramCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 30, width: 30),
            const Gap(4),
            AppText(
              textAlign: .center,
              title: title,
              fontWeight: FontWeight.w700,
              maxLine: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class PinnedTopBar extends StatefulWidget {
  const PinnedTopBar({super.key, required this.controller});

  final HomeController controller;

  @override
  State<PinnedTopBar> createState() => _PinnedTopBarState();
}

class _PinnedTopBarState extends State<PinnedTopBar> {
  static const double fadeDistance = 120.0;

  double _lastOffset = 0;
  bool _scrollingUp = false;

  @override
  void initState() {
    super.initState();
    widget.controller.scrollController.addListener(_trackDirection);
    print("fesdfsd${_scrollingUp.toString()}");
  }

  void _trackDirection() {
    final sc = widget.controller.scrollController;
    if (!sc.hasClients) return;

    final offset = sc.offset;
    final delta = offset - _lastOffset;

    if (delta < -2) {
      _scrollingUp = true;
    } else if (delta > 2) {
      _scrollingUp = false;
    }
    print("fesdfsd${_scrollingUp.toString()}");
    _lastOffset = offset;
  }

  @override
  void dispose() {
    widget.controller.scrollController.removeListener(_trackDirection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller.scrollController,
      builder: (context, child) {
        double offset = 0;
        if (widget.controller.scrollController.hasClients) {
          offset = widget.controller.scrollController.offset;
        }

        // Top bar: pure offset-based, naturally reversible. transparent -> white.
        final double topProgress = (offset / fadeDistance).clamp(0.0, 1.0);
        final Color topBarColor = Color.lerp(
          Colors.transparent,
          Colors.white,
          topProgress,
        )!;

        // Category row: offset-based fade while scrolling down,
        // but forced back to fully visible on ANY upward scroll.
        final double offsetBasedVisibility = 1.0 - topProgress;
        final double categoryVisible = _scrollingUp
            ? 1.0
            : offsetBasedVisibility;

        final Color categoryColor = Color.lerp(
          Colors.transparent,
          Colors.white,
          categoryVisible,
        )!;
        final double categoryOpacity = categoryVisible.clamp(0.0, 1.0);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(color: topBarColor),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != HomeView().toString()) {
                        Get.offAll(() => DashboardView());
                      }
                    },
                    child: Image.asset(
                      'assets/logo.png',
                      height: 50,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.tv, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => LanguageScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Image.asset(
                        "assets/lang.png",
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.blue),
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: categoryOpacity,
              // FIX: buildCategoryRow is a top-level function in this file,
              // not a method on HomeController — call it directly, not via
              // widget.controller.buildCategoryRow(...).
              child: buildCategoryRow(categoryColor),
            ),
            Gap(6),
          ],
        );
      },
    );
  }
}

Widget buildCategoryRow(Color colorBg) {
  final controller = Get.put(IndexController());

  final categories = ['Giving', 'Prayer', 'Partners', 'Contact'];

  return SizedBox(
    height: 48,
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = controller.selectedCategory.value == category;
        return Center(
          child: InkWell(
            onTap: () => _handleCategoryNavigation(category, true, controller),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: colorBg,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                categories[index],
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

class ScrollShrinkingGap extends StatelessWidget {
  const ScrollShrinkingGap({
    super.key,
    required this.scrollController,
    this.maxHeight = 100.0,
    this.minHeight = 0.0,
    this.shrinkDistance = 120.0,
  });

  final ScrollController scrollController;
  final double maxHeight;
  final double minHeight;
  final double
  shrinkDistance; // pixels of scroll to go from maxHeight -> minHeight

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        double offset = 0;
        if (scrollController.hasClients) {
          offset = scrollController.offset;
        }

        final double progress = (offset / shrinkDistance).clamp(0.0, 1.0);
        final double height = maxHeight - (maxHeight - minHeight) * progress;

        return SizedBox(height: height);
      },
    );
  }
}

void _handleCategoryNavigation(
  String category,
  bool fromHome,
  IndexController controller,
) async {
  if (controller.selectedCategory.value == category) return;

  controller.updateCategory(category);
  switch (category) {
    case 'Giving':
      if (fromHome) {
        await Get.to(() => GivingHubView());
        // yaha wapas aaye matlab back press hua
        controller.selectedCategory.value = '';
      } else {
        Get.off(() => GivingHubView());
      }
      break;

    case 'Prayer':
      if (fromHome) {
        await Get.to(() => PrayerHubView());
        controller.selectedCategory.value = '';
      } else {
        Get.off(() => PrayerHubView());
      }
      break;

    case 'Partners':
      if (fromHome) {
        await Get.to(() => PartnersHubView());
        controller.selectedCategory.value = '';
      } else {
        Get.off(() => PartnersHubView());
      }
      break;

    case 'Contact':
      if (fromHome) {
        await Get.to(() => const ContactView());
        controller.selectedCategory.value = '';
      } else {
        Get.off(() => const ContactView());
      }
      break;
  }
}
