import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.black)
        ),
        backgroundColor: Colors.white,
      ),
      body: 
      // InAppWebView(
      //   onWebViewCreated: (controller) {
      //     controller.loadUrl(url: "https://forms.gle/kmoJS34n7FXDeH2KA");
      //     print(controller.isLoading());
      //   },
      //   onLoadError: (controller, url, code, message) {
      //     print(message);
      //   },
      //   onLoadStart: (controller, url) {
      //     print(url);
      //   },
      // )
      WebView(
        onWebViewCreated: (controller) {
          controller.loadUrl("https://docs.google.com/forms/d/e/1FAIpQLScBOR7jBFT2HtkysylxEpykHFPIeGiJRWK1k0bB9JU70kuOjA/viewform");
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}