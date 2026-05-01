import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  int _loadingProgress = 0;
  bool _isLoading = true;
  int _currentIndex = 0;

  final List<String> _urls = [
    'https://efathatv.com/',
    'https://efathatv.com/e-store/',
    'https://efathatv.com/efatha-tv/',
    'https://efathatv.com/global-giving/',
  ];

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _updateIndexFromUrl(url);
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
              _loadingProgress = 0;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            final String url = request.url;

            // Handle external links
            if (!url.startsWith('https://efathatv.com') &&
                !url.startsWith('https://www.efathatv.com')) {
              _launchUrl(url);
              return NavigationDecision.prevent;
            }

            // Handle specific protocols
            if (url.startsWith('tel:') ||
                url.startsWith('mailto:') ||
                url.startsWith('whatsapp:')) {
              _launchUrl(url);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_urls[0]));
  }

  void _updateIndexFromUrl(String url) {
    for (int i = 0; i < _urls.length; i++) {
      if (url == _urls[i] || url == '${_urls[i]}/') {
        setState(() {
          _currentIndex = i;
        });
        break;
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            if (await _controller.canGoBack()) {
              _controller.goBack();
            } else {
              // Option to show exit dialog
              if (mounted) {
                final shouldExit = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Exit App'),
                    content: const Text('Do you want to exit the app?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );

                if (shouldExit ?? false) {
                  if (!mounted) return;
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  } else {
                    // Force exit if no route to pop
                    SystemNavigator.pop();
                  }
                }
              }
            }
          },
          child: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () => _controller.reload(),
                child: WebViewWidget(controller: _controller),
              ),
              if (_isLoading)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value: _loadingProgress / 100.0,
                    backgroundColor: Colors.transparent,
                    color: const Color(0xFF0D47A1),
                    minHeight: 3,
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _controller.loadRequest(Uri.parse(_urls[index]));
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0D47A1),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            activeIcon: Icon(Icons.tv),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Giving',
          ),
        ],
      ),
    );
  }
}
