import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/ui/profile/widgets/basicinfo_widget.dart';
import 'package:flutter_sr/ui/profile/widgets/contactinfo_widget.dart';
import 'package:flutter_sr/ui/profile/widgets/header_widget.dart';
import 'widgets/security_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  List<Widget> _tabs = <Widget>[
    Tab(child: Text('Basic Info')),
    Tab(child: Text('Contact Info')),
    Tab(child: Text('Security'))
  ];

  List<Widget> _tabViewChildren = <Widget>[
    BasicInfoWidget(),
    ContactInfoWidget(),
    SecurityWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            HeaderWidget(),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  indicatorColor: Colors.amber,
                  labelColor: AppColors.PRIMARY_COLOR,
                  //labelPadding: EdgeInsets.symmetric(vertical: 25.0),
                  tabs: _tabs,
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: _tabViewChildren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get maxExtent => this._tabBar.preferredSize.height;

  @override
  double get minExtent => this._tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Card(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
