import 'dart:async';
import 'dart:developer';

import 'package:bidya/core/utils/custom_text.dart';
import 'package:bidya/features/screens/home/screens/webview_render.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _webviewLoaded = false;

  void _onWebViewLoaded() {
    setState(() {
      _webviewLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboard();
      //  / Trigger rebuild to show WebView
    });
  }

  dashboard() async {
    await Future.delayed(Duration(seconds: 2), () {
      _onWebViewLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Offstage(offstage: !_webviewLoaded, child: WebviewRender()),

          if (!_webviewLoaded)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: BlinkWidget(
                  child: Image.asset(
                    height: 150,
                    width: 250,
                    "assets/images/icon.png",
                  ),
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BlinkWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const BlinkWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<BlinkWidget> createState() => _BlinkWidgetState();
}

class _BlinkWidgetState extends State<BlinkWidget> {
  bool _visible = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _visible = !_visible;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.easeInOut,
      opacity: _visible ? 1.0 : 0.0,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
