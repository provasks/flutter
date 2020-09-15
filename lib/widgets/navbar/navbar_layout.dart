import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_logo.dart';

import 'navbar_item.dart';

class NavbarLayout extends StatelessWidget {
  const NavbarLayout({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: getNavbarItems(),
          )
        ],
      ),
    );
  }

  getNavbarItems() {
    var widgets = List<Widget>();
    for (var menuItem in config.menuItems) {
      widgets.add(NavbarItem(menuItem["name"]));
    }
    return widgets;
  }
}
