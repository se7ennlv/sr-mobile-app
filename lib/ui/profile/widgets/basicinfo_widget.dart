import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/item_model.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BasicInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    final getDate = DateTime.parse(user.hiringDate);
    final dateFormatted = DateFormat("dd-MMM-yyyy").format(getDate);

    List<ItemModel> items = [
      ItemModel(null, 'ID:', '${user.empId}', null),
      ItemModel(null, 'Name:', '${user.fullName}', null),
      ItemModel(null, 'Position:', '${user.jobTitle}', null),
      ItemModel(null, 'Department:', '${user.deptName}', null),
      ItemModel(null, 'Hiring Date', '$dateFormatted', null)
    ];

    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final ItemModel item = items[index];

              return ListTile(
                visualDensity: VisualDensity(vertical: -4),
                leading: Icon(
                  Icons.circle,
                  size: 12.0,
                  color: AppColors.ICON_ACCENT_COLOR,
                ),
                title: Text('${item.title}'),
                trailing: Text('${item.subtitle}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
