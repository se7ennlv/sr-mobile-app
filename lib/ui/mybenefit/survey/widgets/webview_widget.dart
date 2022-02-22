import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/providers/benefit_provider.dart';
import 'package:flutter_sr/ui/base_view.dart';
import 'package:flutter_sr/ui/mybenefit/survey/widgets/webview_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class WebViewWidget extends StatefulWidget {
  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  var arg = Get.arguments;

  Future<String> get setUrl async {
    var docUrl = arg[1];

    await Future.delayed(Duration(seconds: 2));
    return '$docUrl';
  }

  @override
  Widget build(BuildContext context) {
    var docId = arg[0];
    var docTopic = arg[2];

    return BaseView<BenefitProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget(title: '$docTopic'),
          ),
          body: Container(
            child: FutureBuilder(
              future: setUrl,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return WebViewPage(docId: docId, url: snapshot.data);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
