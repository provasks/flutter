import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Projects"),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                'projects',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
