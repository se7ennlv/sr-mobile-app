import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/common/utils/text_styles.dart';
import 'package:flutter_sr/core/models/mybenefit/mymart_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/mymart_item_widget.dart';

class MyMartPage extends StatefulWidget {
  @override
  _MyMartPageState createState() => _MyMartPageState();
}

class _MyMartPageState extends State<MyMartPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'My Mart Records'),
      ),
      body: Container(
        child: FutureBuilder(
          future: BenefitService.fetchAllMyMart(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final MyMartModel model = snapshot.data;

              var totalCredit = double.parse((model.sum).toStringAsFixed(2));
              var creditBalance =
                  double.parse((model.balance).toStringAsFixed(2));

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
                            final MyMart _item = items[index];

                            return MyMartItemWidget(item: _item);
                          },
                        ),
                        SizedBox(height: 28.0),
                        Divider(height: 2.0),
                        _buildFooter(totalCredit, creditBalance),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "No data found!",
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
      ),
    );
  }

  Widget _buildFooter(totalCredit, creditBalance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total credit: (฿ $totalCredit)'),
              Text(
                'Credit balance: (฿ $creditBalance)',
                style: TextStyles.BOLD,
              ),
            ],
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
