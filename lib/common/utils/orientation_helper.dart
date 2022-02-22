import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum Orientations {
  portraitOnly,
  landscapeOnly,
  rotating,
}

RouteSettings rotationSettings(GetPage settings, Orientations rotation) {
  return RouteSettings(name: settings.name, arguments: rotation);
}

class NavigatorObserverWithOrientation extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    if (previousRoute.settings.arguments is Orientations) {
      _setOrientation(previousRoute.settings.arguments);
    } else {
      _setOrientation(Orientations.portraitOnly);
    }
  }

  @override
  void didPush(Route route, Route previousRoute) {
    if (route.settings.arguments is Orientations) {
      _setOrientation(route.settings.arguments);
    } else {
      _setOrientation(Orientations.portraitOnly);
    }
  }
}

void _setOrientation(Orientations orientation) {
  List<DeviceOrientation> orientations;
  switch (orientation) {
    case Orientations.portraitOnly:
      orientations = [
        DeviceOrientation.portraitUp,
      ];
      break;
    case Orientations.landscapeOnly:
      orientations = [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
    case Orientations.rotating:
      orientations = [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
  }

  SystemChrome.setPreferredOrientations(orientations);
}
