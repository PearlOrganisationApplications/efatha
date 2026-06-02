import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen({super.key, required this.url});
  MyWebController controller = Get.put(MyWebController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.currentUrl.value.isEmpty
                ? 'Loading...'
                : controller.currentUrl.value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          // Back button
          Obx(
            () => IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: controller.canGoBack.value ? controller.goBack : null,
            ),
          ),
          // Forward button
          Obx(
            () => IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: controller.canGoForward.value
                  ? controller.goForward
                  : null,
            ),
          ),
          // Reload
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.reload,
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(url)),
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              domStorageEnabled: true,
              useHybridComposition: true, // Android performance
            ),
            onWebViewCreated: controller.onWebViewCreated,
            onLoadStart: controller.onLoadStart,
            onLoadStop: controller.onLoadStop,
            onProgressChanged: controller.onProgressChanged,
            onReceivedError: (c, req, err) => controller.onLoadError(
              c,
              req.url,
              err.type.toValue() as int,
              err.description,
            ),
          ),

          // Loading indicator
          Obx(
            () => controller.isLoading.value
                ? LinearProgressIndicator(value: controller.progress.value)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class MyWebController extends GetxController {
  // InAppWebView ka native controller
  InAppWebViewController? webViewController;

  // Reactive state variables
  RxBool isLoading = true.obs;
  RxDouble progress = 0.0.obs;
  RxString currentUrl = ''.obs;
  RxBool canGoBack = false.obs;
  RxBool canGoForward = false.obs;

  // URL change hone par call hota hai
  void onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
  }

  void onLoadStart(InAppWebViewController controller, WebUri? url) {
    isLoading.value = true;
    currentUrl.value = url?.toString() ?? '';
  }

  void onLoadStop(InAppWebViewController controller, WebUri? url) async {
    isLoading.value = false;
    canGoBack.value = await controller.canGoBack();
    canGoForward.value = await controller.canGoForward();
  }

  void onProgressChanged(InAppWebViewController controller, int prog) {
    progress.value = prog / 100.0;
  }

  void onLoadError(
    InAppWebViewController controller,
    WebUri? url,
    int code,
    String message,
  ) {
    isLoading.value = false;
    Get.snackbar('Error', 'Page load failed: $message');
  }

  // Navigation methods
  void goBack() => webViewController?.goBack();
  void goForward() => webViewController?.goForward();
  void reload() => webViewController?.reload();
  void loadUrl(String url) {
    webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }
}
