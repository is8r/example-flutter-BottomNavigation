import 'package:ExampleBottomNavigation/settings/Routes.dart';
import 'package:ExampleBottomNavigation/settings/TabItem.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    Key key,
    @required this.tabItem,
    @required this.routerName,
    @required this.navigationKey,
  }) : super(key: key);

  final TabItem tabItem;
  final String routerName;
  final GlobalKey<NavigatorState> navigationKey;

  @override
  Widget build(BuildContext context) {

    return Navigator(
      key: navigationKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return Routes.routes[routerName](context);
          },
        );
      },
    );
  }
}
