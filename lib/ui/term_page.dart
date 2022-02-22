import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/core/models/option_model.dart';
import 'package:flutter_sr/core/services/utils_service.dart';

class TermPage extends StatefulWidget {
  @override
  _TermPageState createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  Future<OptionItem> futureOption;

  @override
  void initState() {
    super.initState();
    futureOption = UtilsService.getOptions('term');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'Term & Conditions'),
      ),
      body: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: futureOption,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Html(
                        data: snapshot.data.optionValue,
                        customTextAlign: (_) => TextAlign.justify,
                        defaultTextStyle: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
