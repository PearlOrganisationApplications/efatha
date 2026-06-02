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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image — top 75% of card
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image.network(
                    //   program['image']!,
                    //   fit: BoxFit.cover,
                    //   errorBuilder: (context, error, stackTrace) => Container(
                    //     color: Colors.grey.shade100,
                    //     child: const Icon(
                    //       Icons.broken_image_rounded,
                    //       color: Colors.grey,
                    //       size: 28,
                    //     ),
                    //   ),
                    // ),
                    Image.asset(
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

                    // Dark gradient at bottom
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Play icon
                    const Positioned(
                      bottom: 6,
                      right: 6,
                      child: Icon(
                        Icons.play_circle_filled_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Title — bottom
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(14),
                  ),
                ),
                child: Center(
                  child: Text(
                    program['title']!,
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
