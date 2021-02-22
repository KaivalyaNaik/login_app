import 'package:flutter/material.dart';
import 'package:login_app/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundColor,
            ),
            body: WebView(
              initialUrl: 'https://flutter.dev',
              javascriptMode: JavascriptMode.unrestricted,
            )));
  }
}
