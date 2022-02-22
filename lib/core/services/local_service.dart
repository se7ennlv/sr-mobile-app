import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_sr/core/models/drawer_menu_model.dart';
import 'package:flutter_sr/core/models/listtile_model.dart';

class LocalService {
  static Future<List<ListTileItem>> fetchListTileJson(String fileName) async {
    final dataSrc = 'assets/json/$fileName.json';
    final response = await rootBundle.loadString(dataSrc);
    final jsonResponse = await json.decode(response);

    ListTileModel model = ListTileModel.fromJson(jsonResponse);

    return model.items;
  }

  static Future<List<DrawerMenu>> fetchJsonDrawerMenus() async {
    final dataSrc = 'assets/json/drawer_menus.json';
    final response = await rootBundle.loadString(dataSrc);
    final jsonResponse = await json.decode(response);

    DrawerMenuModel items = DrawerMenuModel.fromJson(jsonResponse);

    return items.drawerMenu;
  }
}
