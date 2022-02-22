import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/appbar_widget.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/about_model.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:transparent_image/transparent_image.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<About> futureAbout;
  final String endpoint = AppHttp.baseUrl;

  @override
  void initState() {
    super.initState();
    futureAbout = UtilsService.fetchAbout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(title: 'About Savan Resorts'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: futureAbout,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  style: TextStyle(fontSize: 16.0),
                                  text: snapshot.data.srDesc,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              //_launchURL(snapshot.data.srVdoUrl);
                            },
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: "$endpoint/${snapshot.data.srImage}",
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              fadeInDuration: Duration(seconds: 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  style: TextStyle(fontSize: 16.0),
                                  text: snapshot.data.thsDesc,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 50.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              //_launchURL(snapshot.data.srVdoUrl);
                            },
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: "$endpoint/${snapshot.data.thsImage}",
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              fadeInDuration: Duration(seconds: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
    );
  }
}
