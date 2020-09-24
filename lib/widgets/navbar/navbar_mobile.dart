import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/navbar/nav_drawer/side_drawer.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class NavbarMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavbarMobileState();
  }
}

class NavbarMobileState extends State<NavbarMobile> {
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0.0, right: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                NavbarLogo()
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 25.0,
                  height: 25.0,
                  margin: EdgeInsets.only(right: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    iconSize: 4,
                    icon: Image.asset('${config.imagePath}/search.png'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 25.0,
                  height: 25.0,
                  margin: EdgeInsets.only(right: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                    iconSize: 4,
                    icon: Image.asset('${config.imagePath}/sync.png'),
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
