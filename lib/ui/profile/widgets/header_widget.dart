import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/config/app_http.dart';
import 'package:flutter_sr/core/models/user_model.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    const endpoint = AppHttp.baseUrl;
    final fileSrc = user.fileSrc;
    final photoSrc = '$endpoint/$fileSrc';

    return SliverAppBar(
      brightness: Brightness.dark,
      floating: true,
      snap: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: 8.0),
        title: Row(
          children: [
            Expanded(
              child: ListTile(
                title: _buildName(user.fullName),
                subtitle: _buildJobTitle(user.jobTitle),
              ),
            ),
          ],
        ),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('assets/images/bg_profile.webp', fit: BoxFit.cover),
            Positioned(
              top: 55.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                child: CircleAvatar(
                  radius: 65.0,
                  backgroundColor: Colors.transparent,
                  child: user.fileSrc != null
                      ? _buildProfileImage(photoSrc)
                      : _buildNullProfileImage(),
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      expandedHeight: 250.0,
    );
  }

  Widget _buildProfileImage(photoSrc) {
    return CircleAvatar(
      radius: 65.0,
      backgroundImage: CachedNetworkImageProvider(photoSrc),
    );
  }

  Widget _buildNullProfileImage() {
    return CircleAvatar(
      radius: 65.0,
      child: Icon(Icons.person_pin, size: 130.0),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildName(String name) {
    return BorderedText(
      strokeWidth: 3.0,
      strokeColor: AppColors.CHELSEA_GEM_COLOR,
      child: Text(
        '$name',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildJobTitle(String jobTitle) {
    return BorderedText(
      strokeWidth: 3.0,
      strokeColor: AppColors.CHELSEA_GEM_COLOR,
      child: Text(
        '$jobTitle',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
