import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/hrinfo/article_model.dart';
import 'package:intl/intl.dart';

class FeedDetailPage extends StatefulWidget {
  final Article item;

  FeedDetailPage({this.item});

  @override
  _FeedDetailPageState createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    final endpoint = AppHttp.baseUrl;
    final imgSrc = '$endpoint/${item.fileSrc}';

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            brightness: Brightness.dark,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  '${item.topic}',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    '$imgSrc',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: item.desc,
                      defaultTextStyle: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.access_time,
                      color: Colors.black54,
                    ),
                    label: Text(
                      new DateFormat("dd-MMM-yy H:mm a").format(
                        DateTime.parse('${item.publishedAt}'),
                      ),
                      style: TextStyle(color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
