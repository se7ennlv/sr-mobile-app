import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/providers/benefit_provider.dart';
import 'package:flutter_sr/common/ui/pdf_viewer/widgets/fab_widget.dart';
import 'package:flutter_sr/common/ui/pdf_viewer/widgets/next_button_widget.dart';
import 'package:flutter_sr/common/ui/pdf_viewer/widgets/previous_button_widget.dart';
import 'package:flutter_sr/ui/base_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../appbar_widget.dart';

class PDFViewerPage extends StatelessWidget {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final baseUrl = AppHttp.baseUrl;

    final String docTitle = arg[0];
    String docName = arg[1];
    final String password = arg[2];
    final bool isPayslip = arg[3];

    if (isPayslip) {
      docName = 'ehr/temp/${arg[1]}';
    }

    final String docUrl = '$baseUrl/$docName';

    return BaseView<BenefitProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget(title: docTitle),
          ),
          body: PDF(
            password: password,
            defaultPage: 0,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            pageSnap: true,
            onError: (error) {
              //print('Error ${error}');
            },
            onPageError: (page, error) {
              //print('$page: ${error.toString()}');
            },
            onPageChanged: (current, total) {
              _pageCountController.add('${current + 1}/$total');
            },
            onViewCreated: (PDFViewController pdfViewController) async {
              _pdfViewController.complete(pdfViewController);
              final int currentPage =
                  await pdfViewController.getCurrentPage() ?? 0;
              final int pageCount = await pdfViewController.getPageCount();
              _pageCountController.add('${currentPage + 1} / $pageCount');
            },
          ).cachedFromUrl(
            docUrl,
            placeholder: (progress) => Center(child: Text('$progress %')),
            errorWidget: (error) => Center(child: Text('Invalid doc url')),
          ),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }

  Widget _buildFloatingActionButton() {
    final bool isPayslip = arg[3];

    return FutureBuilder<PDFViewController>(
      future: _pdfViewController.future,
      builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
        if (snapshot.hasData) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              !isPayslip ? _buildPageController(snapshot.data) : SizedBox(),
              isPayslip ? FabWidget() : SizedBox(),
            ],
          );
        }
        return SizedBox();
      },
    );
  }

  Widget _buildPageController(snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: PreviousButtonWidget(snapshot),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: _buildMonitoringPage(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: NextButtonWidget(snapshot),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonitoringPage() {
    return FloatingActionButton(
      onPressed: () => null,
      backgroundColor: Colors.black54,
      child: StreamBuilder<String>(
        stream: _pageCountController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                snapshot.data,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          return SizedBox();
        },
      ),
    );
  }
}
