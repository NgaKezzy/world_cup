import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:worldcup_app/common/common.dart';

class WebViewScreen extends StatelessWidget {
  final String header;
  final String url;
  const WebViewScreen({super.key, required this.header, required this.url});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: header,
              onTap: () => Get.back(),
            ),
            Expanded(
              child: WebView(
                initialUrl: url,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
