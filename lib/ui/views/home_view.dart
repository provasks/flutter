import 'package:flutter/material.dart';
import 'package:schmersal_poc/ui/views/client_list_view.dart';
import 'package:schmersal_poc/widgets/navbar/navbar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Navbar(),
            // Text("Client list will go here."),
            Expanded(
              child: ClientList(),
            )
          ],
        ),
      ),
    );
  }
}