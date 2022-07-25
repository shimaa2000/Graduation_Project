import 'package:flutter/material.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaybalScreen extends StatefulWidget {
  PaybalScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = 'PaybalScreen';
  @override
  State<PaybalScreen> createState() => _PaybalScreenState();
}

class _PaybalScreenState extends State<PaybalScreen> {
  String? token = CashHelper.getData(key: 'token');
  String url = 'https://dressuit.herokuapp.com/api/order/62ddd0c4f27a8f10a90a940e/payment';
  String _loadHTML() {
    return '''
    <html>
      <body onload="document.f.submit();">
        <form id="f" name="f" mehtod="get" action="$url">
          <input type="hidden" name="token" value="$token"/>
        </form>
      </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        onPageFinished: (page) {},
        onWebViewCreated: (WebViewController webViewController){
          Map<String, String> headers={'token': '${CashHelper.getData(key: 'token')}'};
          webViewController.loadUrl(url, headers: headers);
          },
        javascriptMode: JavascriptMode.unrestricted,
       // initialUrl:
        //    Uri.dataFromString(_loadHTML(), mimeType: 'text/html').toString(),
      ),
    );
  }
}
