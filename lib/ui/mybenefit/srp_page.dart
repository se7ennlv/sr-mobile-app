import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/srp_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/srp_item_widget.dart';

class SrpPage extends StatefulWidget {
  @override
  _SrpPageState createState() => _SrpPageState();
}

class _SrpPageState extends State<SrpPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'My SRP Records'),
      ),
      body: FutureBuilder(
        future: BenefitService.fetchAllSrp(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final SrpModel model = snapshot.data;
            var totalScore = double.parse((model.sum).toStringAsFixed(2));

            if (model.items.length > 0) {
              final items = model.items;

              return RefreshIndicator(
                key: _keyRefresh,
                onRefresh: _refreshing,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 1),
                        itemBuilder: (context, index) {
                          final Srp item = items[index];

                          return SrpItemWidget(item: item);
                        },
                      ),
                      SizedBox(height: 28.0),
                      Divider(height: 2.0),
                      _buildFooter(totalScore),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "No results found.",
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Network Error, ${snapshot.error}"),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildFooter(totalScore) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Total score: ($totalScore)',
            style: TextStyle(fontWeight: FontWeight.bold),
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
