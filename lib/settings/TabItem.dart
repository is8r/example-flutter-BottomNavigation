import 'package:flutter/material.dart';

enum TabItem {
  home,
  star,
  settings,
}

const TabItemInfo = <TabItem, Map>{
  TabItem.home: {
    'icon': Icons.home_outlined,
    'label': 'home',
    'routerName': '/home',
  },
  TabItem.star: {
    'icon': Icons.star_outline,
    'label': 'star',
    'routerName': '/star',
  },
  TabItem.settings: {
    'icon': Icons.settings_outlined,
    'label': 'settings',
    'routerName': '/settings',
  },
};
