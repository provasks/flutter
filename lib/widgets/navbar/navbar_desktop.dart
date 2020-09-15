import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_logo.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: getMenuItems(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('assets/images/Language.png'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 46.0,
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('assets/images/User Profile.png'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getMenuItems() {
    var widgets = List<Widget>();
    widgets.add(NavbarLogo());
    for (var menuItem in config.menuItems) {
      widgets.add(FlatButton(
        onPressed: () {
          print('${menuItem["name"]} button pressed');
        },
        child: Text(
          menuItem["name"],
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueAccent,
            // backgroundColor: Colors.grey,
          ),
        ),
      ));
    }
    return widgets;
  }
}
