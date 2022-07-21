import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PaybalScreen extends StatelessWidget {
  const PaybalScreen({Key? key}) : super(key: key);
  static const routeName='PaybalScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        onPageFinished: (page){},
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'http://10.0.2.2:8000/pay',
      ),
    );
  }
}
