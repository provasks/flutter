import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/navbar/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'client_list_view.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeView extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Clients", Icons.list),
    new DrawerItem("Project", Icons.art_track),
    new DrawerItem("Language", Icons.language),
    new DrawerItem("SignOut", Icons.logout),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomeView> {
  int _selectedDrawerIndex = 0;
  SharedPreferences prefs;
  _getDrawerItemWidget(int pos) {
     switch (pos) {
      case 0:
       // return new FirstFragment();
      case 1:
       // return new SecondFragment();
      case 2:
       // return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Thomas Crane"),
              accountEmail: new Text("Global Admin"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/images.jpg"),

              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Navbar(),
            Expanded(
              child: ClientList(),
            )
          ],
        ),
      ),
    );
  }
}

