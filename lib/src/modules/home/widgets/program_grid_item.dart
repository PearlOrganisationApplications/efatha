import 'dart:async';

import 'package:efatha_tv/src/modules/home/widgets/video.vlm.dart';
import 'package:efatha_tv/src/modules/media/views/video.reuabale.dart';
import 'package:efatha_tv/web.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramGridItem extends StatelessWidget {
  int index;
  final Map<String, dynamic> program;

  ProgramGridItem({super.key, required this.program, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String url = "";

        switch (index) {
          case 0:
            url = "https://youtu.be/yQCxde-_22Q?si=bDzZoPMUafKGHx5g";
            break;

          case 1:
            url = "1039423029";
            break;

          case 2:
            url = "1039423393";
            break;

          case 3:
            url = "1039423097";
            break;

          case 4:
            url = "1039422918";
            break;

          case 5:
            url =
                "https://www.youtube.com/embed/E_ngT9vuXXo?si=cyefggyqG2HtIjfa";
            break;

          case 6:
            url = "1039424176";
            break;

          case 7:
            url = "1039423607";
            break;
          case 8:
            url = "1039422918";
            break;
          case 9:
            url = "1038616246";
            break;

          case 10:
            url = "1039448708";
            break;

          case 11:
            url = "1039423296";
            break;

          default:
            url = "";
        }

        Get.to(() => VideoPlayerScreen(videoUrl: url));
      },
      borderRadius: BorderRadius.circular(14),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image — top 75% of card
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                  bottom: Radius.circular(14),
                ),
                child: Image.asset(
                  program['image']!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade100,
                    child: const Icon(
                      Icons.broken_image_rounded,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),

            // Title — bottom
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //     decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.vertical(
            //         bottom: Radius.circular(14),
            //       ),
            //     ),
            //     child: Center(
            //       child: Text(
            //         program['title']!,
            //         style: GoogleFonts.outfit(
            //           fontSize: 11,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black87,
            //         ),
            //         textAlign: TextAlign.center,
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProgramAutoSlider extends StatefulWidget {
  final List<List<int>>
  columns; // each entry = list of program indices in that column
  final List<Map<String, dynamic>> programs;
  final double cardWidth;
  final double spacing;
  final Duration interval;

  const ProgramAutoSlider({
    super.key,
    required this.columns,
    required this.programs,
    required this.cardWidth,
    required this.spacing,
    this.interval = const Duration(seconds: 3),
  });

  @override
  State<ProgramAutoSlider> createState() => _ProgramAutoSliderState();
}

class _ProgramAutoSliderState extends State<ProgramAutoSlider> {
  late final PageController _controller;
  Timer? _timer;

  static const int _loopMultiplier = 5000;
  late int _initialPage;

  @override
  void initState() {
    super.initState();

    final columnCount = widget.columns.length;
    _initialPage = columnCount == 0 ? 0 : (_loopMultiplier ~/ 2) * columnCount;

    _controller = PageController(
      viewportFraction:
          (widget.cardWidth + widget.spacing) /
          (widget.cardWidth * 2 + widget.spacing), // shows ~1.something columns
      initialPage: _initialPage,
    );

    _startAutoSlide();
  }

  void _startAutoSlide() {
    if (widget.columns.isEmpty) return;
    _timer = Timer.periodic(widget.interval, (_) {
      if (!_controller.hasClients) return;
      final nextPage =
          (_controller.page ?? _initialPage.toDouble()).round() + 1;
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void _pauseAutoSlide() => _timer?.cancel();

  void _resumeAutoSlide() {
    _timer?.cancel();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final columnCount = widget.columns.length;
    if (columnCount == 0) return const SizedBox();

    return Listener(
      onPointerDown: (_) => _pauseAutoSlide(),
      onPointerUp: (_) => _resumeAutoSlide(),
      onPointerCancel: (_) => _resumeAutoSlide(),
      child: PageView.builder(
        controller: _controller,
        itemCount: columnCount * _loopMultiplier,
        itemBuilder: (context, index) {
          final realColIndex = index % columnCount;
          final colIndices = widget.columns[realColIndex];

          return Padding(
            padding: EdgeInsets.only(right: widget.spacing),
            child: SizedBox(
              width: widget.cardWidth,
              child: Column(
                children: [
                  for (int i = 0; i < colIndices.length; i++) ...[
                    Expanded(
                      child: ProgramGridItem(
                        program: widget.programs[colIndices[i]],
                        index: colIndices[i],
                      ),
                    ),
                    if (i != colIndices.length - 1) const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
