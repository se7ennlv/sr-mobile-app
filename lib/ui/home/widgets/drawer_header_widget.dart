import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/user_model.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final UserModel user;
  DrawerHeaderWidget(this.user);

  @override
  Widget build(BuildContext context) {
    const endpoint = AppHttp.baseUrl;
    final fileSrc = user.fileSrc;
    final profileImage = '$endpoint/$fileSrc';

    return UserAccountsDrawerHeader(
      currentAccountPicture: fileSrc != null
          ? _buildAvatarHasImage(profileImage)
          : _buildAvatarNoImage(),
      accountName: Text(
        '${user.fullName}',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      accountEmail: Text('${user.email}'),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bg_drawer.webp'),
        ),
      ),
    );
  }

  Widget _buildAvatarHasImage(String fileSrc) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: CachedNetworkImageProvider(fileSrc),
    );
  }

  Widget _buildAvatarNoImage() {
    return CircleAvatar(
      child: Icon(Icons.person_pin, size: 70.0),
      backgroundColor: Colors.white,
    );
  }
}
