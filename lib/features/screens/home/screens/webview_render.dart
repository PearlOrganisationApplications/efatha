import 'dart:async';
import 'dart:developer';
import 'package:bidya/core/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewRender extends StatefulWidget {
  const WebviewRender({super.key});

  @override
  State<WebviewRender> createState() => _WebviewRenderState();
}

class _WebviewRenderState extends State<WebviewRender> {
  InAppWebViewController? _controller;
  bool _isControllerReady = false;

  late StreamSubscription<List<ConnectivityResult>> _subscription;
  String _status = "Checking...";
  bool hasWebError = false;
  bool isWebProgress = false;

  final String webUrl = 'https://sparcs.co.tz/';
  // final String webUrl = 'https://page-pop-frontend.vercel.app/login';

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    _listenToConnectionChanges();
    // clearData();
  }

  clearData() async {
    await CookieManager.instance().deleteAllCookies();

    // Clear Cache
    await InAppWebViewController.clearAllCache();

    // Reload PayPal Page
    _controller?.reload();
  }

  Future<void> _checkInitialConnection() async {
    List<ConnectivityResult> results = await Connectivity().checkConnectivity();
    _updateStatus(results);
  }

  void _listenToConnectionChanges() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      _updateStatus(results);
    });
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final previousStatus = _status;
    setState(() {
      _status = results.contains(ConnectivityResult.none)
          ? 'Offline'
          : 'Online';
    });

    if (previousStatus == 'Offline' &&
        _status == 'Online' &&
        _controller != null) {
      _controller!.reload();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        log("------------------------------------------");
        await alertBox();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _status != "Online"
            ? _buildOfflineUI()
            : hasWebError
            ? _buildErrorUI()
            : SafeArea(
                child: Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: WebUri(webUrl), // ✅ FIXED
                      ),
                      initialSettings: InAppWebViewSettings(
                        // ✅ FIXED
                        javaScriptEnabled: true,
                        cacheEnabled: true,
                        clearCache: false,
                        supportZoom: false,
                        allowFileAccessFromFileURLs: true,
                        // allowUniversalAccessFromFileURLs: true,
                        mediaPlaybackRequiresUserGesture: false,
                      ),

                      onWebViewCreated: (controller) {
                        _controller = controller;
                        _isControllerReady = true;
                      },

                      // ✅ This handles <input type="file">
                      onLoadStart: (controller, url) {
                        log('Page started loading: $url');
                        setState(() {
                          isWebProgress = true;
                          hasWebError = false;
                        });
                      },
                      onLoadStop: (controller, url) async {
                        log('Page finished loading: $url');
                        setState(() {
                          isWebProgress = false;
                          hasWebError = false;
                        });
                      },
                      onLoadError: (controller, url, code, message) {
                        log('Web load error: $message');
                        setState(() {
                          isWebProgress = false;
                          hasWebError = true;
                        });
                      },
                      onProgressChanged: (controller, progress) {
                        setState(() {
                          isWebProgress = progress < 100;
                        });
                      },
                    ),
                    if (isWebProgress)
                      const Center(
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
      ),
    );
  }

  alertBox() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CText("Exit"),
          content: CText("Are you sure you want to exit the app"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // close dialog
                SystemNavigator.pop();
              },
              child: CText("Exit", isSelectable: false),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CText("Cancel", isSelectable: false),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOfflineUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/no-disconnect.png"),
          const SizedBox(height: 30),
          const CText(
            "No Internet Connection",
            fontsize: 20,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/408-error.jpg"),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_isControllerReady && _controller != null) {
                _controller!.reload();
              }
            },
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
