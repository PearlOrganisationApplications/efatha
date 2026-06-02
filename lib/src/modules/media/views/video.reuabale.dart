import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CleanVimeoPlayer extends StatefulWidget {
  final String videoUrl;
  const CleanVimeoPlayer({super.key, required this.videoUrl});

  @override
  State<CleanVimeoPlayer> createState() => _CleanVimeoPlayerState();
}

class _CleanVimeoPlayerState extends State<CleanVimeoPlayer> {
  InAppWebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(
              "${widget.videoUrl}"
              "?title=0"
              "&byline=0"
              "&portrait=0"
              "&badge=0"
              "&autoplay=1"
              "&controls=1"
              "&speed=1"
              "&pip=1",
            ),
          ),

          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: true,
            mediaPlaybackRequiresUserGesture: false,
            allowsInlineMediaPlayback: true,
            transparentBackground: true,
            supportZoom: false,
            useShouldOverrideUrlLoading: true,
          ),

          onWebViewCreated: (controller) {
            _controller = controller;
          },

          onLoadStop: (controller, url) async {
            await Future.delayed(const Duration(seconds: 1));

            await controller.evaluateJavascript(
              source: """
              (function() {

                const hideSelectors = [
                  'header',
                  'footer',
                  '.vp-header',
                  '.vp-footer',
                  '.vp-sidebar',
                  '.recommended-videos',
                  '.vp-related',
                  '.comments',
                  '.vp-comments',
                  '.vp-embed-footer',
                  '.title',
                  '.owner',
                  '.badge',
                  '[class*="Recommended"]',
                  '[class*="Comments"]'
                ];

                hideSelectors.forEach(selector => {
                  document.querySelectorAll(selector).forEach(el => {
                    el.style.display = 'none';
                    el.style.visibility = 'hidden';
                    el.remove();
                  });
                });

                document.body.style.margin = '0';
                document.body.style.padding = '0';
                document.body.style.overflow = 'hidden';

                const player = document.querySelector('video');
                if (player) {
                  player.setAttribute('playsinline', '');
                  player.play().catch(() => {});
                }

              })();
              """,
            );
          },

          shouldOverrideUrlLoading: (controller, navigationAction) async {
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
