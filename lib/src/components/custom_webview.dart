import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

import '../constants/color.dart';


class WebviewComponent extends StatelessWidget {
  String url;
  String title;
  int? topPadding;
  bool shortHeader;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  late WebViewController _webViewController;
  WebviewComponent(this.url, this.title, this.topPadding,
      {super.key, this.shortHeader = false});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorConstants.primary,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black, size: 24.0),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          )),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: Uri.encodeFull(url),
        geolocationEnabled: true,
        onWebViewCreated: (WebViewController webViewController) async {
          _webViewController = webViewController;
          _controller.complete(webViewController);
          await webViewController.runJavascript(
              'navigator.geolocation.getCurrentPosition(function(position) { console.log(position); });');
        },
        onProgress: (int progress) {
          if (!shortHeader) {
            _webViewController.runJavascript(
                "if(document.getElementsByTagName('header')[0]) {document.getElementsByTagName('header')[0].remove(); if(document.getElementsByTagName('body')[0]) document.getElementsByTagName('body')[0].style.marginTop = '-${topPadding}px';}");
            _webViewController.runJavascript(
                "if(document.getElementsByTagName('header')[0]) document.getElementsByTagName('header')[0].remove();");
            _webViewController.runJavascript(
                "if(document.getElementsByClassName('menu-uslugi-mobile')[0]) document.getElementsByClassName('menu-uslugi-mobile')[0].remove();");
          } else {
            _webViewController.runJavascript(
                "if(document.getElementsByTagName('header')[0]) document.getElementsByTagName('header')[0].remove(); ");
            _webViewController.runJavascript(
                "if(document.getElementsByTagName('header')[0]) document.getElementsByTagName('header')[0].remove(); ");
            _webViewController.runJavascript(
                "if(document.getElementsByTagName('body')[0]) document.getElementsByTagName('body')[0].style.marginTop = '-${topPadding}px'; ");
          }
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          if (!shortHeader) {
            // Removes header and footer from page
            _webViewController.runJavascript(
                "let head3 =document.getElementsByTagName('header')[0]; if(head3) head3.remove();" "let head4 =document.getElementsByTagName('header')[0]; if(head4) head4.remove();");
            _webViewController.runJavascript(
                "let fot = document.getElementsByTagName('footer')[0]; fot.remove();");
          }
        },
      ),
    );
  }
}
