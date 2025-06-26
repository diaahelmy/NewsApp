import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {

  final String url ;
  const WebviewScreen(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Web Site'),
    ),

        body: WebViewWidget(controller: WebViewController()
          ..loadRequest(Uri.parse(url))),);
  }
}
