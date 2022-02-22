import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/promotion_model.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class ProVerticalWidget extends StatefulWidget {
  @override
  _ProVerticalWidgetState createState() => _ProVerticalWidgetState();
}

class _ProVerticalWidgetState extends State<ProVerticalWidget> {
  var _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UtilsService.getAllPromotions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            int startIndex = 0;

            if (Get.arguments != false && Get.arguments != true) {
              startIndex = Get.arguments;
            }

            return RefreshIndicator(
              key: _keyRefresh,
              onRefresh: _refreshing,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Swiper(
                  index: startIndex,
                  itemBuilder: (BuildContext context, int index) {
                    final baseUrl = AppHttp.baseUrl;
                    final Promotion item = snapshot.data[index];
                    final imgSrc = '$baseUrl/${item.fileSrc}';

                    return CachedNetworkImage(
                      imageUrl: imgSrc,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                  autoplay: false,
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.vertical,
                  pagination: new SwiperPagination(
                    alignment: Alignment.centerRight,
                  ),
                  control: new SwiperControl(color: Colors.white),
                  itemWidth: double.infinity,
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
            child: Text("Network Error!"),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> _refreshing() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
