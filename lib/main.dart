import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'config/app_color.dart';
import 'config/app_info.dart';
import 'config/app_routes.dart';
import 'config/locator.dart';
import 'core/models/user_model.dart';
import 'core/services/user_service.dart';

void main() {
  setupLocator();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.PRIMARY_COLOR,
  ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>(
      lazy: false,
      initialData: UserModel.initial(),
      create: (context) => locator<UserService>().userStream,
      child: GetMaterialApp(
        title: AppInfo.APP_NAME,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.PRIMARY_COLOR,
          highlightColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: AppRoutes.generateRoute,
      ),
    );
  }
}
