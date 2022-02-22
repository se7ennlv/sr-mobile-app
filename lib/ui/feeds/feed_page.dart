import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/hrinfo/article_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:transparent_image/transparent_image.dart';
import 'feed_detail_page.dart';

final endpoint = AppHttp.baseUrl;

class FeedPage extends StatefulWidget {
  final bool showAppBar;

  FeedPage({this.showAppBar = false});

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final _keyRefresh = GlobalKey<RefreshIndicatorState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: widget.showAppBar ? AppBarWidget(title: 'SR Feeds') : Text(''),
      ),
      body: FutureBuilder(
        future: BenefitService.fetchArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return RefreshIndicator(
                key: _keyRefresh,
                onRefresh: _refreshing,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 50),
                  itemBuilder: (context, index) {
                    final Article _item = snapshot.data[index];

                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: <Widget>[
                            _buildHeader(item: _item),
                            _buildBody(item: _item),
                            _buildDesc(item: _item),
                            _buildFooter(item: _item),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              );
            } else {
              return Center(
                child: Text('Network Error'),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Network Error'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildHeader({@required Article item}) {
    return ListTile(
      title: Text(
        item.topic,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }

  Widget _buildBody({@required Article item}) {
    final imgSrc = '$endpoint/${item.fileSrc}';

    return GestureDetector(
      child: item.fileSrc != null
          ? _buildNetworkImage(imgSrc)
          : Icon(
              Icons.panorama,
              size: 150.0,
            ),
      onTap: () {
        _buildDetailLink(item);
      },
    );
  }

  void _buildDetailLink(Article item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedDetailPage(item: item),
      ),
    );
  }

  Widget _buildNetworkImage(fileSrc) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: '$fileSrc',
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
      fadeInDuration: Duration(seconds: 1),
    );
  }

  Widget _buildDesc({@required Article item}) {
    return ListTile(
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Html(
          data: item.desc,
          //renderNewlines: true,
          defaultTextStyle: TextStyle(color: Colors.black87, fontSize: 14.0),
        ),
      ),
    );
  }

  Widget _buildFooter({Article item}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Chip(
            backgroundColor: Colors.black45,
            avatar: Icon(Icons.person_pin, color: Colors.white),
            label: Text('Admin', style: TextStyle(color: Colors.white)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: TextButton.icon(
            onPressed: () {
              _buildDetailLink(item);
            },
            icon: Icon(
              Icons.read_more,
              color: Colors.black54,
            ),
            label: Text(
              'Read more',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
