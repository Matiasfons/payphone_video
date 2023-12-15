import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutPage extends StatefulWidget {
  final Function success;
  final Function cancel;
  final Function expirado;
  final String url;
  final double width;
  final double height;

  const CheckoutPage(
      {super.key,
      required this.success,
      required this.cancel,
      required this.expirado,
      required this.url,
      required this.width,
      required this.height});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            try {
              if (request.url ==
                  "https://pay.payphonetodoesposible.com/PayPhone/Cancelled") {
                widget.cancel();
              }
              if (request.url ==
                  "https://pay.payphonetodoesposible.com/Direct/") {
                widget.success();
              }
              if (request.url.split('/')[4].toString() == "Expired") {
                widget.expirado();
              }
              return NavigationDecision.navigate;
            } catch (e) {
              print(e);

              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: WebViewWidget(controller: controller),
    );
  }
}
