import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/core/models/listtile_model.dart';
import 'package:flutter_sr/core/services/local_service.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/ui/term_page.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  List<Function> _functions = [
    _pushToTermPage,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: LocalService.fetchListTileJson('service_menus'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              return RefreshIndicator(
                key: _keyRefresh,
                onRefresh: _refreshing,
                child: ListView.separated(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  separatorBuilder: (context, int index) => Divider(height: 1),
                  itemBuilder: (context, int index) {
                    final ListTileItem item = snapshot.data[index];

                    return ListTile(
                      leading: Icon(
                        IconData(int.tryParse(item.leading),
                            fontFamily: 'MaterialIcons'),
                        color: AppColors.ICON_ACCENT_COLOR,
                        size: 50.0,
                      ),
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        int checkLength = _functions.length - 1;

                        if (index <= checkLength) {
                          _functions[index](context);
                        } else {
                          _showSnackBar(context);
                        }
                      },
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
              child: Text('${snapshot.error}'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}

_pushToTermPage(context) {
  Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => TermPage(),
    ),
  );
}

_showSnackBar(context) {
  infoSnackBar(
    'Thanks for tapped',
    'This function will be implemented soon.',
    'top',
  );
}
