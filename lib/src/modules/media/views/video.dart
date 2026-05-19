import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CastrPlayerScreen extends StatefulWidget {
  const CastrPlayerScreen({super.key});

  @override
  State<CastrPlayerScreen> createState() => _CastrPlayerScreenState();
}

class _CastrPlayerScreenState extends State<CastrPlayerScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(onPageFinished: (url) => debugPrint('Loaded: $url')),
      )
      ..loadRequest(
        Uri.parse(
          'https://player.castr.com/d_ad1609f0374111f0a0869d26a7445c29',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: WebViewWidget(controller: _controller),
    );
  }
}
