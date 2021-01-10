import 'package:ExampleBottomNavigation/settings/TabItem.dart';
import 'package:flutter/material.dart';
class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
    this.currentIndex,
    this.onSelect,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<TabItem> onSelect;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        bottomItem(
          context,
          tabItem: TabItem.home,
        ),
        bottomItem(
          context,
          tabItem: TabItem.star,
        ),
        bottomItem(
          context,
          tabItem: TabItem.settings,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onSelect(TabItem.values[index]);
      },
    );
  }

  BottomNavigationBarItem bottomItem(
    BuildContext context, {
    TabItem tabItem,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        TabItemInfo[tabItem]['icon'],
      ),
      label: TabItemInfo[tabItem]['label'],
    );
  }
}
