import 'package:flutter/material.dart';
import 'package:payphone/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: getRoutes(),
      initialRoute: "/principal",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
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
                // widget.cancelled();
                print('cancelado');
              }
              if (request.url ==
                  "https://pay.payphonetodoesposible.com/Direct/") {
                // widget.success();
                print('pagado');
              }
              if (request.url.split('/')[4].toString() == "Expired") {
                // widget.cancelled();

                print('Expirado');
              }
              return NavigationDecision.navigate;
            } catch (e) {
              print(e);

              return NavigationDecision.navigate;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse('https://payp.page.link/fyBB'));
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: WebViewWidget(controller: controller));
  }
}
