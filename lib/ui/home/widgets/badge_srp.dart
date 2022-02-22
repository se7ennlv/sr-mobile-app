import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeSrp extends StatelessWidget {
  final dynamic score;
  BadgeSrp({this.score = 0.0});

  @override
  Widget build(BuildContext context) {
    final totalScore = double.parse((score).toStringAsFixed(2));

    return Badge(
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(5),
      position: BadgePosition.topEnd(top: -12, end: -20),
      padding: EdgeInsets.all(2),
      badgeContent: Text(
        '$totalScore',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text('Total score'),
    );
  }
}
