import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/common/ui/snackbar.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/config/app_utils.dart';
import 'package:flutter_sr/core/providers/navigation_provider.dart';
import 'package:flutter_sr/ui/feeds/feed_page.dart';
import 'package:flutter_sr/ui/home/widgets/dialog_logout_widget.dart';
import 'package:flutter_sr/ui/home/widgets/drawer_widget.dart';
import 'package:flutter_sr/ui/hrinfo/docs_page.dart';
import '../base_view.dart';
import '../setting_page.dart';
import '../../common/ui/pro_vertical_widget.dart';
import '../service_page.dart';

class HomePage extends StatefulWidget {
  @override
  _Homeuitate createState() => _Homeuitate();
}

class _Homeuitate extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 2;
  String _title = 'HR Information';
  DateTime backBtnPressedTime;

  List<Widget> _ui = <Widget>[
    FeedPage(showAppBar: false),
    ProVerticalWidget(),
    DocsPage(showAppBar: false),
    ServicePage(),
    SettingPage()
  ];

  List<String> _titles = [
    'SR Feeds',
    'Promotions',
    'HR Information',
    'Services',
    'Settings',
  ];

  Widget build(BuildContext context) {
    return BaseView<NavigationProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: _buildAppBar(),
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            backgroundColor: Colors.black54,
            content: Text('Tap back again to leave'),
          ),
          child: Container(
            child: _ui.elementAt(_selectedIndex),
          ),
        ),
        drawer: DrawerWidget(),
        bottomNavigationBar: _buildBottomNavBar(provider),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(_title),
      centerTitle: true,
      backgroundColor: AppColors.PRIMARY_COLOR,
      brightness: Brightness.dark,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {
            infoSnackBar('Thanks for tapped',
                'Notifications module will be implemented soon', 'top');
          },
        ),
        IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () => showLogoutDialog(),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppUtils.APPBAR_BOTTOM_RADIUS),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(provider) {
    void _onItemTapped(int index) {
      provider.currentIndex = index;
      _selectedIndex = provider.currentIndex;
      _title = _titles[index];
    }

    return ConvexAppBar(
      backgroundColor: AppColors.PRIMARY_COLOR,
      cornerRadius: AppUtils.BNB_CORNER_RADIUS,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.redeem, title: 'Promotions'),
        TabItem(icon: Icons.contacts, title: 'HR'),
        TabItem(icon: Icons.local_florist, title: 'Services'),
        TabItem(icon: Icons.settings, title: 'Settings'),
      ],
      initialActiveIndex: 2,
      onTap: (int index) => _onItemTapped(index),
    );
  }
}
