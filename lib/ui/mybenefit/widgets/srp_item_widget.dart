import 'package:flutter/material.dart';
import 'package:flutter_sr/common/utils/text_styles.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/mybenefit/srp_model.dart';
import 'package:intl/intl.dart';

class SrpItemWidget extends StatelessWidget {
  final Srp item;

  SrpItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: _buildLeading(),
      title: Text('Doc No. ${item.docNo}'),
      subtitle: _buildSubtitle(),
      children: [
        _buildCommentDetail(),
      ],
    );
  }

  Widget _buildLeading() {
    return CircleAvatar(
      backgroundColor: AppColors.ICON_ACCENT_COLOR,
      foregroundColor: Colors.white,
      child: Text('${item.reqScore}', style: TextStyles.BOLD),
    );
  }

  Widget _buildSubtitle() {
    final expiryIn = DateTime.parse(item.expiryIn);
    final dateFormatted = DateFormat("dd-MMM-yy").format(expiryIn);

    return Text("Expiry In: $dateFormatted");
  }

  Widget _buildCommentDetail() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
      child: ListTile(
        title: Text('HOD Comments:'),
        subtitle: Text("${item.hodComment}"),
      ),
    );
  }
}
