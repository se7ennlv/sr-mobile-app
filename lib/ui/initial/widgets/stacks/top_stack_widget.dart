import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/services/utils_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class TopStackWidget extends StatefulWidget {
  @override
  _TopStackWidgetState createState() => _TopStackWidgetState();
}

class _TopStackWidgetState extends State<TopStackWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }

  void afterFirstLayout(BuildContext context) async {
    final bool showPopup =
        await UtilsService.getOptionSingleValue('popup').then((value) {
      return value;
    });

    if (showPopup) {
      final String popupFile = await UtilsService.getDocPopup().then((value) {
        return value;
      });

      if (popupFile != null) {
        _showDialog(popupFile);
      }
    }
  }

  void _showDialog(String popupFile) {
    Size size = MediaQuery.of(context).size;
    final imageUrl = '${AppHttp.baseUrl}/$popupFile';

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (
        BuildContext buildContext,
        Animation animation,
        Animation secondaryAnimation,
      ) {
        return Center(
          child: Material(
            child: Stack(
              children: [
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.85,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(result: true),
                  icon: Icon(Icons.close),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
