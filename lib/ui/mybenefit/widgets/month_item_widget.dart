import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/dialogs/checkpoint_dialog.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/mybenefit/month_model.dart';
import 'package:flutter_sr/core/providers/boolean_provider.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/providers/user_provider.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../../base_view.dart';

class MonthItemWidget extends StatefulWidget {
  final Month item;
  MonthItemWidget({this.item});

  @override
  _MonthItemWidgetState createState() => _MonthItemWidgetState();
}

class _MonthItemWidgetState extends State<MonthItemWidget> {
  @override
  Widget build(BuildContext context) {
    final yearSelected = Provider.of<SingleValueProvider>(context).currentValue;

    return BaseView<UserProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            BaseView<BooleanProvider>(
              builder: (context, states, child) {
                final _isBusy = states.currentValue;

                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: _buildLeading(),
                        title: Text('${widget.item.monthName}'),
                        subtitle: Text('${widget.item.desc}'),
                        trailing: Text('($yearSelected)'),
                        onTap: () {
                          _showCheckpointDialog(context);
                        },
                      ),
                      _isBusy ? LinearProgressIndicator() : SizedBox()
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildLeading() {
    return CircleAvatar(
      backgroundColor: AppColors.ICON_ACCENT_COLOR,
      child: Text(
        '${widget.item.monthCode}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showCheckpointDialog(context) {
    checkpointDialog(context).then(
      (result) {
        if (result != null && result != false) {
          Provider.of<BooleanProvider>(context, listen: false).currentValue =
              true;
          _getPayslip(context, result);
        }
      },
    );
  }

  void _getPayslip(context, String password) async {
    final year = Provider.of<SingleValueProvider>(context, listen: false);
    final state = Provider.of<BooleanProvider>(context, listen: false);

    final yearSelected = year.currentValue;
    final monthCode = widget.item.monthCode;

    Map<String, dynamic> formData = {
      'month': monthCode,
      'year': yearSelected,
      'password': password
    };

    await BenefitService.getPayslip(formData).then(
      (docName) {
        if (docName != null && docName != false) {
          final String docTitle = 'Payslip of ($monthCode/$yearSelected)';

          List<dynamic> _args = [
            docTitle,
            docName,
            password,
            true,
            monthCode,
            yearSelected,
          ];

          Get.toNamed('/pdfviewer', arguments: _args);
        } else {
          var alertMsg = "No data available for you’ve entered period";
          warningSnackBar('Sorry!', alertMsg, 'top');
        }

        state.currentValue = false;
      },
    );
  }
}
