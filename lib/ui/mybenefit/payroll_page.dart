import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/month_model.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/month_item_widget.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/year_item_widget.dart';
import '../base_view.dart';

class PayrollPage extends StatefulWidget {
  @override
  _PayrollPageState createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SingleValueProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarWidget(title: 'Payroll'),
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  YearItemWidget(),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: FutureBuilder(
                      future: UtilsService.getAllMonths(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.length > 0) {
                            return RefreshIndicator(
                              key: _keyRefresh,
                              onRefresh: _refreshing,
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final Month item = snapshot.data[index];

                                  return MonthItemWidget(item: item);
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
                            child: Text('Network Error, ${snapshot.error}'),
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
