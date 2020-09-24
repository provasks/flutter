import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('${config.imagePath}/search.png'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('${config.imagePath}/Language.png'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('images/Sync.png'),
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      await preferences.clear();
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  // width: 100,
                  child: SizedBox(
                    width: 90,
                    child: Text(
                      "Thomas Crane Global Admin",
                      style: Styles.username,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  width: 46.0,
                  child: IconButton(
                    iconSize: 40,
                    icon: Image.asset('${config.imagePath}/images.jpg'),
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
      widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: menuItem["name"] == "Clients"
                    ? hexToColor("#EAEEF9")
                    : Colors.white,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            onPressed: () {
              print('${menuItem["name"]} button pressed');
            },
            child: Text(
              menuItem["name"],
              style: Styles.defaultStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}
