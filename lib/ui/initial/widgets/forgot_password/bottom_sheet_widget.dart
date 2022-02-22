import 'package:flutter/material.dart';
import 'package:flutter_sr/core/providers/auth_provider.dart';
import 'package:flutter_sr/core/providers/single_value_provider.dart';
import 'package:flutter_sr/ui/initial/widgets/forgot_password/verify_otp_page.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import '../../../base_view.dart';
import 'create_otp_page.dart';

Future<dynamic> bottomSheetWidget(BuildContext context) async {
  final PageController _pageControl = PageController(initialPage: 0);

  Get.bottomSheet(
    BaseView<AuthProvider>(
      builder: (context, authProvider, child) {
        return BaseView<SingleValueProvider>(
          builder: (context, singleProvider, child) {
            return ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 24.0),
                Container(
                  height: 150.0,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: _pageControl,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CreateOtpPage(
                        pageControl: _pageControl,
                        authProvider: authProvider,
                        singleProvider: singleProvider,
                      ),
                      VerifyOtpPage(
                        pageControl: _pageControl,
                        singleProvider: singleProvider,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
  );
}
