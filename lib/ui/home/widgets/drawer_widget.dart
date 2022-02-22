import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/config/app_info.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:flutter_sr/core/providers/auth_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../../base_view.dart';
import 'badge_mymart.dart';
import 'badge_srp.dart';
import 'drawer_header_widget.dart';
import 'drawer_item_model.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController =
        ScrollController(initialScrollOffset: 0);

    UserModel user = Provider.of<UserModel>(context);

    return BaseView<AuthProvider>(
      builder: (context, model, child) {
        return Drawer(
          child: Column(
            children: [
              DrawerHeaderWidget(user),
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: false,
                  controller: _scrollController,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItemHeader(text: 'MY BENEFITS'),
                      DrawerItemModel(
                        icon: Icons.score_outlined,
                        title: 'SRP',
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: BadgeSrp(score: user.srpScore),
                        ),
                        onTap: () => _navigator('/srp'),
                      ),
                      DrawerItemModel(
                        icon: Icons.add_shopping_cart_outlined,
                        title: 'My Mart',
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: BadgeMyMart(balance: user.mymartBalance),
                        ),
                        onTap: () => _navigator('/mymart'),
                      ),
                      DrawerItemModel(
                        icon: Icons.exit_to_app_outlined,
                        title: 'Leave',
                        onTap: () => _navigator('/leave'),
                      ),
                      DrawerItemModel(
                        icon: Icons.date_range_outlined,
                        title: 'Roster & Attendance',
                        onTap: () => _navigator('/roster'),
                      ),
                      DrawerItemModel(
                        icon: Icons.payment_outlined,
                        title: 'Payroll',
                        onTap: () => _navigator('/payroll'),
                      ),
                      DrawerItemModel(
                        icon: Icons.airline_seat_flat_outlined,
                        title: 'Clinic Records',
                        onTap: () => _navigator('/clinic'),
                      ),
                      DrawerItemModel(
                        icon: Icons.check_circle_outline,
                        title: 'Survey Records',
                        onTap: () => _navigator('/survey'),
                      ),
                      _buildDivider(),
                      _buildDrawerItemHeader(text: 'HR INFORMATION'),
                      DrawerItemModel(
                        icon: Icons.topic_outlined,
                        title: 'Documents',
                        onTap: () => _navigator('/docs', arg: true),
                      ),
                      _buildDivider(),
                      _buildDrawerItemHeader(text: 'Personal Info'),
                      DrawerItemModel(
                        icon: Icons.person_pin_outlined,
                        title: 'Profile',
                        onTap: () => _navigator('/profile'),
                      ),
                      SizedBox(height: 25.0),
                      _buildDivider(),
                      _buildDrawerBottom()
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItemHeader({String text}) {
    return ListTile(
      title: Text(text),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1.0, color: Colors.grey);
  }

  Widget _buildDrawerBottom() {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Version (${AppInfo.APP_VERSION})',
                    style: TextStyle(color: AppColors.ACCENT_COLOR),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      'About',
                      style: TextStyle(color: AppColors.ACCENT_COLOR),
                    ),
                    onTap: () => _navigator('/about'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigator(String routeName, {bool arg = false}) {
    Get.back(result: arg);
    Get.toNamed(routeName, arguments: arg);
  }
}
