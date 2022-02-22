import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/core/providers/benefit_provider.dart';
import 'package:flutter_sr/ui/mybenefit/survey/survey_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final dynamic docId;
  final String url;

  WebViewPage({this.docId, this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  WebView _webView;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    _webView = WebView(
      initialUrl: widget.url,
      gestureRecognizers: Set()
        ..add(
          Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
          ),
        ),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      onProgress: (int progress) {
        return Center(
          child: Text('loading  $progress%'),
        );
      },
      gestureNavigationEnabled: true,
      onPageFinished: (String url) {
        //print('Page finished loading: $url');
        _isSubmitted(url);
      },
    );
  }

  void _isSubmitted(String keyWord) async {
    if (keyWord.contains('/formResponse') || keyWord.contains('/submit')) {
      final provider = Provider.of<BenefitProvider>(context, listen: false);

      Map<String, dynamic> putData = {'docId': widget.docId};
      final result = await provider.submitMySurvey(putData);

      if (result) {
        final message = 'Your answers is has been submitted.';
        successSnackBar('Success', message, 'top');
      } else {
        dangerSnackBar('Error', 'Something went wrong');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _webView = null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: _webView, onWillPop: () => Get.off(SurveyPage()));
  }
}
