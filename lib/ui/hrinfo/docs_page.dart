import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/hrinfo/widgets/doc_main_widget.dart';

class DocsPage extends StatefulWidget {
  final bool showAppBar;

  DocsPage({this.showAppBar = false});

  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: widget.showAppBar
            ? AppBarWidget(title: 'HR Information')
            : SizedBox(),
      ),
      //appBar: widget.showAppBar ? AppBarWidget(title: 'HR Information',) : null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: BenefitService.fetchAllMainDocs(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                return RefreshIndicator(
                  key: _keyRefresh,
                  onRefresh: _refreshing,
                  child: MainDocWidget(items: snapshot.data),
                );
              } else {
                return Center(
                  child: Text(
                    "No data found.",
                    style: TextStyle(fontSize: 18.0),
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Network Error, \n ${snapshot.error}'),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
