import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/core/models/hrinfo/doc_main_model.dart';

import '../doc_detail_page.dart';

class MainDocWidget extends StatefulWidget {
  final List<MainDoc> items;

  MainDocWidget({Key key, this.items}) : super(key: key);

  @override
  _MainDocWidgetState createState() => _MainDocWidgetState();
}

class _MainDocWidgetState extends State<MainDocWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(18.0),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 3,
        children: List.generate(widget.items.length, (index) {
          return _buildGridCell(context, widget.items[index]);
        }),
      ),
    );
  }

  Widget _buildGridCell(BuildContext context, MainDoc item) {
    return GestureDetector(
      onTap: () async {
        final String groupId = item.sId;
        final String groupTitle = item.title;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocDetailPage(groupId, groupTitle),
          ),
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              IconData(int.parse(item.mLeading), fontFamily: 'MaterialIcons'),
              size: 70.0,
              color: AppColors.ICON_ACCENT_COLOR,
            ),
            Text(
              '${item.title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ),
        // color: Colors.white70,
      ),
    );
  }
}
