import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/common/utils/text_styles.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/mybenefit/mymart_model.dart';
import 'package:intl/intl.dart';

class MyMartItemWidget extends StatelessWidget {
  final MyMart item;

  MyMartItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildLeading(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildTrailing(),
      onTap: () => null,
    );
  }

  Widget _buildLeading() {
    return Badge(
      badgeColor: AppColors.ICON_ACCENT_COLOR,
      badgeContent: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${item.totalCredit} ฿', style: TextStyles.BOLD_WHITE),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Doc No. ${item.docNo}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    final tranDate = DateTime.parse(item.tranDate);
    final dateFormatted = DateFormat('dd-MMM-yy H:mm:ss a').format(tranDate);

    return Text(dateFormatted);
  }

  Widget _buildTrailing() {
    final text = DateFormat("dd-MMM-yy").format(
      DateTime.parse(item.updatedAt),
    );

    return Text('$text');
  }
}
