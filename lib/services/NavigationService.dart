import 'package:ExampleBottomNavigation/settings/Routes.dart';
import 'package:ExampleBottomNavigation/settings/TabItem.dart';
import 'package:flutter/material.dart';

class NavigationService {
  //singleton
  static final _instance = NavigationService._internal();
  NavigationService._internal();
  static NavigationService getInstance() {
    return _instance;
  }

  //root state
  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  //tab state
  TabItem currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> tabNavigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.star: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  static NavigatorState getRootState() {
    return NavigationService.getInstance().rootNavigatorKey.currentState;
  }

  static NavigatorState getCurrentTabState() {
    return NavigationService.getInstance()
        .tabNavigatorKeys[NavigationService.getInstance().currentTab]
        .currentState;
  }

  static Future<dynamic> pushInTab(String routeName, {Object arguments}) {
    return Navigator.push(
      NavigationService.getCurrentTabState().context,
      Routes.onGenerateRoute(
        RouteSettings().copyWith(name: routeName, arguments: arguments),
      ),
    );
  }

  static Future<dynamic> pushNamedRoot(String routeName, {Object arguments}) {
    return Navigator.pushNamed(
      NavigationService.getRootState().context,
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushRoot(String routeName, {Object arguments}) {
    return Navigator.push(
      NavigationService.getRootState().context,
      Routes.onGenerateRoute(
        RouteSettings().copyWith(name: routeName, arguments: arguments),
      ),
    );
  }
}
