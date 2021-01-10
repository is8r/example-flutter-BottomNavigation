import 'package:ExampleBottomNavigation/services/NavigationService.dart';
import 'package:ExampleBottomNavigation/settings/TabItem.dart';
import 'package:ExampleBottomNavigation/widgets/BottomNavigation.dart';
import 'package:ExampleBottomNavigation/widgets/TabNavigator.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Widget _buildTabItem(
    TabItem tabItem,
  ) {
    return Offstage(
      offstage: NavigationService.getInstance().currentTab != tabItem,
      child: TabNavigator(
        navigationKey:
            NavigationService.getInstance().tabNavigatorKeys[tabItem],
        tabItem: tabItem,
        routerName: TabItemInfo[tabItem]['routerName'],
      ),
    );
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab =
        !await NavigationService.getCurrentTabState().maybePop();
    if (isFirstRouteInCurrentTab) {
      if (NavigationService.getInstance().currentTab != TabItem.home) {
        onSelect(TabItem.home);
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  void onSelect(TabItem tabItem) {
    if (NavigationService.getInstance().currentTab == tabItem) {
      NavigationService.getCurrentTabState().popUntil((route) => route.isFirst);
    } else {
      setState(() {
        NavigationService.getInstance().currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTabItem(
            TabItem.home,
          ),
          _buildTabItem(
            TabItem.star,
          ),
          _buildTabItem(
            TabItem.settings,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: NavigationService.getInstance().currentTab.index,
        onSelect: onSelect,
      ),
    );
  }
}
