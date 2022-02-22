import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/clinic_model.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/year_item_widget.dart';

import '../../base_view.dart';
import 'widgets/item_widget.dart';

class ClinicPage extends StatefulWidget {
  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SingleValueProvider>(builder: (context, provider, child) {
      final selectedYear = provider.currentValue;

      return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          child: Column(
            children: [
              YearItemWidget(),
              Expanded(
                child: FutureBuilder(
                  future: BenefitService.getAllClinics(selectedYear),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return RefreshIndicator(
                          key: _keyRefresh,
                          onRefresh: _refreshing,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              separatorBuilder: (context, index) =>
                                  Divider(height: 1),
                              itemBuilder: (context, index) {
                                final Clinic _item = snapshot.data[index];

                                return ItemWidget(item: _item);
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "No results found.",
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
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
      );
    });
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBarWidget(title: 'My Clinic Records'),
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
