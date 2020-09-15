import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/navbar/nav_drawer/drawer_item.dart';
import 'package:schmersal_poc/widgets/navbar/nav_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          getNavbarItems(),
        ],
      ),
    );
  }

  getNavbarItems() {
    var widgets = List<Widget>();
    for (var menuItem in config.menuItems) {
      widgets.add(DrawerItem(menuItem["name"], menuItem["icon"]));
    }
    return widgets;
  }
}
