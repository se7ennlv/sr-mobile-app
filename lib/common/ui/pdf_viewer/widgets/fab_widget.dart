import 'package:flutter/material.dart';
import 'package:flutter_sr/core/providers/benefit_provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../snackbar.dart';

class FabWidget extends StatefulWidget {
  @override
  _FabWidgetState createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BenefitProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: provider.busy ? _buildLoading() : _buildSendButton(),
        ),
        _buildToggle(),
      ],
    );
  }

  Widget _buildSendButton() {
    return Container(
      child: FloatingActionButton(
        heroTag: 'actions',
        tooltip: 'Sent to email',
        child: Icon(Icons.forward_to_inbox),
        onPressed: () {
          sendToEmail();
        },
      ),
    );
  }

  Widget _buildLoading() {
    return CircularProgressIndicator();
  }

  Widget _buildToggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  void sendToEmail() async {
    final provider = Provider.of<BenefitProvider>(context, listen: false);
    var arg = Get.arguments;

    Map<String, dynamic> objData = {
      'month': arg[4],
      'year': arg[5],
      'attached': arg[1]
    };

    final result = await provider.sendPayslipToEmail(objData);

    if (result) {
      successSnackBar('Success', 'Sent, please check your email', 'top');
    } else {
      dangerSnackBar('Error', 'Something went wrong!');
    }
  }
}
