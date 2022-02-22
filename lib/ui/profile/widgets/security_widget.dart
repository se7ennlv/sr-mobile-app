import 'package:flutter/material.dart';
import 'package:flutter_sr/common/storage/shared_preferences.dart';
import 'package:flutter_sr/common/ui/bottom_sheets/change_password/change_password_widget.dart';
import 'package:flutter_sr/common/ui/dialogs/checkpoint_dialog.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../base_view.dart';

class SecurityWidget extends StatefulWidget {
  @override
  _SecurityWidgetState createState() => _SecurityWidgetState();
}

class _SecurityWidgetState extends State<SecurityWidget> {
  SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    final passwordUpdated = Provider.of<UserModel>(context).passwordUpdatedAt;
    final getDate = DateTime.parse(passwordUpdated);
    final dateFormatted = DateFormat("dd-MMM-yy").format(getDate);

    return BaseView<UserProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.vpn_key,
                      size: 50.0,
                      color: AppColors.ICON_ACCENT_COLOR,
                    ),
                    title: Text('Change Password'),
                    subtitle: Text('Last changed $dateFormatted'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      _showCheckpointDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCheckpointDialog(context) {
    checkpointDialog(context).then(
      (result) async {
        if (result != null && result != false) {
          changePasswordWidget(context, true);
        }
      },
    );
  }
}
