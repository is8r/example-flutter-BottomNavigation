import 'package:ExampleBottomNavigation/settings/ScreenArguments.dart';
import 'package:flutter/material.dart';

import 'package:ExampleBottomNavigation/pages/DammyPage.dart';
import 'package:ExampleBottomNavigation/pages/RootPage.dart';

class Routes {
  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    final ScreenArguments arg = settings.arguments;

    if (settings.name == '/fullscreen') {
      return MaterialPageRoute(
        builder: (context) => DammyPage(
          title: 'fullscreen',
          arguments: arg,
        ),
        fullscreenDialog: arg.fullscreenDialog,
      );
    } else if (settings.name == '/detail') {
      return MaterialPageRoute(
        builder: (context) => DammyPage(
          title: 'detail',
          arguments: arg,
        ),
        fullscreenDialog: arg.fullscreenDialog,
      );
    } else if (Routes.routes.keys.contains(settings.name)) {
      return MaterialPageRoute(
        builder: routes[settings.name],
      );
    } else {
      throw Exception('invalid route');
    }
  };

  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => RootPage(),
    '/home': (context) => DammyPage(title: 'home'),
    '/star': (context) => DammyPage(title: 'star'),
    '/settings': (context) => DammyPage(title: 'settings'),
  };
}
