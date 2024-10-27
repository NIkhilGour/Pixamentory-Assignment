import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixametory/screens/home_screen.dart';
import 'package:pixametory/screens/tabs.dart';
import 'package:pixametory/services/providers/game_url_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends ConsumerStatefulWidget {
  const WebViewScreen({super.key});

  @override
  ConsumerState<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends ConsumerState<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = ref.watch(gameUrlNotifierProvider);

    // Show a message if the URL is empty
    if (url.isEmpty) {
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const Tabs();
                    },
                  ));
                },
                icon: const Icon(Icons.arrow_back_ios_new))),
        body: const Center(
          child: Text("No Games played yet"),
        ),
      );
    }

    // Initialize and load WebViewController only if URL is available
    final controller = WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams(),
    )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(body: WebViewWidget(controller: controller));
  }
}
