import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/hrinfo/doc_sub_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class DocDetailPage extends StatefulWidget {
  final String groupId;
  final String groupTitle;

  DocDetailPage(this.groupId, this.groupTitle);

  @override
  _DocDetailPageState createState() => _DocDetailPageState();
}

class _DocDetailPageState extends State<DocDetailPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: '${widget.groupTitle}'),
      ),
      body: Container(
        child: FutureBuilder(
          future: BenefitService.fetchAllSubDocs(widget.groupId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                return RefreshIndicator(
                  key: _keyRefresh,
                  onRefresh: _refreshing,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 50),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final SubDoc sub = snapshot.data[index];

                      return ExpansionTile(
                        title: Text(sub.title),
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: sub.item.length,
                            separatorBuilder: (context, index) =>
                                Divider(height: 1),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: ListTile(
                                  title: Text(sub.item[index].title),
                                  subtitle: Text(sub.item[index].subtitle),
                                  onTap: () async {
                                    final docTitle = sub.item[index].subtitle;
                                    final docSrc = sub.item[index].fileSrc;
                                    List<dynamic> _args = [
                                      docTitle,
                                      docSrc,
                                      null,
                                      false
                                    ];

                                    Get.toNamed(
                                      '/pdfviewer',
                                      arguments: _args,
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "No data found!",
                  ),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text('No data found!'),
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
