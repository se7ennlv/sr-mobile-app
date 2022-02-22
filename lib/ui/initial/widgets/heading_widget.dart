import 'package:flutter/material.dart';
import 'package:flutter_sr/config/app_color.dart';

class HeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.0),
      child: Column(
        children: [
          Text(
            'E-SR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.PRIMARY_COLOR,
              fontSize: 18.0,
            ),
          ),
          Text(
            'Information on your hand',
            style: TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontSize: 26.0,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
