import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String? url;

  const WebViewScreen({Key? key, this.url}) : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webView;
  String? url;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              child: progress < 1.0
                  ? LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white,
                    )
                  : Container(),
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(url!)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(),
                ),
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
