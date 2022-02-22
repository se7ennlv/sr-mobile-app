import 'package:flutter/material.dart';
import 'package:flutter_sr/core/models/mybenefit/mysurvey_model.dart';
import 'package:flutter_sr/ui/mybenefit/survey/widgets/webview_widget.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class ItemWidget extends StatelessWidget {
  final MySurvey item;

  ItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ListTile(
        leading: _buildLeading(),
        title: Text('${item.child.topic}'),
        subtitle: _buildSubtitile(),
        trailing: _buildTrailing(),
        onTap: () => _goToWebViewPage(),
      ),
    );
  }

  Widget _buildLeading() {
    return (item.isSubmitted)
        ? Icon(Icons.check_circle, color: Colors.green, size: 36.0)
        : Icon(Icons.hourglass_top_outlined, color: Colors.red, size: 36.0);
  }

  Widget _buildSubtitile() {
    final createdAt = DateTime.parse(item.createdAt);
    final createdAtFormatted = DateFormat("dd-MMM-yy").format(createdAt);

    return Text("Assigned on: $createdAtFormatted");
  }

  Widget _buildTrailing() {
    String msgState = 'Pending';

    if (item.isSubmitted) {
      msgState = 'Done';
    }

    return Text(msgState);
  }

  void _goToWebViewPage() {
    if (!item.isSubmitted) {
      List<dynamic> _args = [item.id, item.child.url, item.child.topic];

      Get.off(() => WebViewWidget(), arguments: _args);
    }
  }
}
