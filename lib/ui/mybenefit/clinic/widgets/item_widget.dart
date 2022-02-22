import 'package:flutter/material.dart';
import 'package:flutter_sr/core/models/mybenefit/clinic_model.dart';
import 'package:intl/intl.dart';

import 'item_detail_widget.dart';

class ItemWidget extends StatelessWidget {
  final Clinic item;

  ItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: _buildLeading(),
      title: _buildTitle(),
      subtitle: Text('${item.diagnosisNote}', maxLines: 1),
      children: [
        ItemDetailWidget(
          itemDetail: item.child,
        ),
      ],
    );
  }

  Widget _buildLeading() {
    var bgColor = Colors.green;
    var code = 'NSL';
    var tooltip = 'No Sick Leave';

    if (item.isSickLeave) {
      bgColor = Colors.red;
      code = 'SL';
      tooltip = 'Sick Leave';
    }

    return CircleAvatar(
      radius: 25.0,
      backgroundColor: bgColor,
      foregroundColor: Colors.white,
      child: Tooltip(
        message: '$tooltip',
        child: Text('$code'),
      ),
    );
  }

  Widget _buildTitle() {
    final visitedAt = DateTime.parse(item.visitedAt);
    final visitedFormatted = DateFormat('dd-MMM-yy').format(visitedAt);
    final updatedAt = DateTime.parse(item.updatedAt);
    final updatedAtFormatted = DateFormat("dd-MMM-yy").format(updatedAt);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Date Visited: $visitedFormatted'),
            Text('$updatedAtFormatted', style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ],
    );
  }
}
