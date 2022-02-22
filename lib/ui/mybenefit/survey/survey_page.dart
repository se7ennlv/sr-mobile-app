import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/mysurvey_model.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/survey/widgets/item_widget.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/year_item_widget.dart';
import '../../base_view.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SingleValueProvider>(
      builder: (context, provider, child) {
        final selectedYear = provider.currentValue;

        return Scaffold(
          appBar: _buildAppBar(),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                YearItemWidget(),
                FutureBuilder(
                  future: BenefitService.fetchAllMySurvey(selectedYear),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return RefreshIndicator(
                          key: _keyRefresh,
                          onRefresh: _refreshing,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            separatorBuilder: (context, index) =>
                                Divider(height: 1.0),
                            itemBuilder: (context, index) {
                              final MySurvey item = snapshot.data[index];

                              return ItemWidget(item: item);
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "No results matched year selected.",
                            ),
                          ),
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Network Error!"),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBarWidget(title: 'My Survey Records'),
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
