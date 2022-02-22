import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sr/common/utils/formatters.dart';

class BadgeMyMart extends StatelessWidget {
  final dynamic balance;
  BadgeMyMart({this.balance = 0.00});

  @override
  Widget build(BuildContext context) {
    final balanceFormatted = Formatters.money.format(balance);

    return Badge(
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(5),
      position: BadgePosition.topEnd(top: -12, end: -20),
      padding: EdgeInsets.all(2),
      badgeContent: Text(
        '$balanceFormatted',
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text('(฿) Balance'),
    );
  }
}
