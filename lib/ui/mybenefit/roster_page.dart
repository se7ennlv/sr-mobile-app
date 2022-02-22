import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/mybenefit/roster_model.dart';
import 'package:flutter_sr/core/services/benefit_service.dart';
import 'package:flutter_sr/ui/mybenefit/widgets/roster_item_widget.dart';

class RosterPage extends StatefulWidget {
  @override
  _RosterPageState createState() => _RosterPageState();
}

class _RosterPageState extends State<RosterPage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'My Roster & Attendance'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: BenefitService.fetchAllRoster(),
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
                        final Roster item = snapshot.data[index];

                        return RosterItemWidget(item: item);
                      },
                    ),
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
                child: Text('${snapshot.error}'),
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
