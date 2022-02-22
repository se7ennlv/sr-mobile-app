import 'package:flutter/material.dart';
import 'package:flutter_sr/common/utils/text_styles.dart';
import 'package:flutter_sr/core/models/mybenefit/leave_model.dart';
import 'package:intl/intl.dart';

class LeaveItemWidget extends StatelessWidget {
  final Leave item;

  LeaveItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: _buildLeading(),
      title: _buildTitle(),
      subtitle: Text('Available Day (${item.leaveDay}) '),
      trailing: _buildTrailing(),
      onTap: () => null,
    );
  }

  Widget _buildLeading() {
    return CircleAvatar(
      backgroundColor: Colors.blue[800],
      child: Text(
        '${item.leaveCode}',
        style: TextStyles.BOLD_WHITE,
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      '${item.leaveDesc}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTrailing() {
    final updatedAt = DateTime.parse(item.updatedAt);
    final dateFormatted = DateFormat("dd-MMM-yy").format(updatedAt);

    return Text(dateFormatted);
  }
}
