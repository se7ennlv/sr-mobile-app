import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/promotion_model.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:flutter_sr/ui/initial/widgets/pro_detail_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class ProHorizontalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UtilsService.getAllPromotions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: double.infinity,
                height: 145.0,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    final endpoint = AppHttp.baseUrl;
                    final Promotion item = snapshot.data[index];
                    final imgSrc = '$endpoint/${item.fileSrc}';

                    return CachedNetworkImage(
                      imageUrl: imgSrc,
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.repeatX,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                  autoplay: false,
                  itemCount: snapshot.data.length,
                  viewportFraction: 0.3,
                  scale: 0.9,
                  itemWidth: 300.0,
                  itemHeight: 200.0,
                  onTap: (int index) {
                    _proDetail(index);
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "No data found.",
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Network error"),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _proDetail(int index) {
    Get.to(
      () => ProDetailWidget(),
      arguments: index,
      fullscreenDialog: true,
      transition: Transition.fade,
    );
  }
}
