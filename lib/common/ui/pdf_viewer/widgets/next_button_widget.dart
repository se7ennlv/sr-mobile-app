import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class NextButtonWidget extends StatelessWidget {
  final dynamic snapshotData;

  NextButtonWidget(this.snapshotData);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.keyboard_arrow_right),
      backgroundColor: Colors.black54,
      heroTag: '+',
      onPressed: () async {
        final PDFViewController pdfController = snapshotData;
        final int currentPage = (await pdfController.getCurrentPage()) + 1;
        final int numberOfPages = await pdfController.getPageCount() ?? 0;
        if (numberOfPages > currentPage) {
          await pdfController.setPage(currentPage);
        }
      },
    );
  }
}
