import 'package:flutter/material.dart';

class NotfoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page not found'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('No route defined'),
      ),
    );
  }
}
