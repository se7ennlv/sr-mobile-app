import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/leave_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/leave_item_widget.dart';

class LeavePage extends StatefulWidget {
  @override
  _LeavePageState createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'Leaves'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: BenefitService.fetchAllLeave(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                return RefreshIndicator(
                  key: _keyRefresh,
                  onRefresh: _refreshing,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemCount: snapshot.data.length,
                      separatorBuilder: (context, index) => Divider(height: 1),
                      itemBuilder: (context, index) {
                        final Leave item = snapshot.data[index];

                        return LeaveItemWidget(item: item);
                      },
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text('No data found!'),
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
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
