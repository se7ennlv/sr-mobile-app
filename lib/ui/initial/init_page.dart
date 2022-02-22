import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sr/config/app_color.dart';
import 'package:flutter_sr/ui/initial/widgets/stacks/bottom_stack_widget.dart';
import 'package:flutter_sr/ui/initial/widgets/stacks/footer_stack_widget.dart';
import 'package:flutter_sr/ui/initial/widgets/stacks/midle_stack_widget.dart';
import 'package:flutter_sr/ui/initial/widgets/stacks/top_stack_widget.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FooterStackWidget(),
                    MidleStackWidget(),
                    BottomStackWidget(),
                    TopStackWidget(),
                  ],
                  clipBehavior: Clip.hardEdge,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: AppColors.PRIMARY_COLOR,
        brightness: Brightness.dark,
      ),
    );
  }
}
