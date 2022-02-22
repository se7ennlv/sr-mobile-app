import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PreviousButtonWidget extends StatelessWidget {
  final dynamic snapshotData;

  PreviousButtonWidget(this.snapshotData);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: '-',
      child: Icon(Icons.keyboard_arrow_left),
      backgroundColor: Colors.black54,
      onPressed: () async {
        final PDFViewController pdfController = snapshotData;
        final int currentPage = await pdfController.getCurrentPage() - 1;
        if (currentPage >= 0) await snapshotData.setPage(currentPage);
      },
    );
  }
}
