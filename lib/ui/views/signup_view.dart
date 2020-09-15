// Sign Up Page
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Sign Up Page"),

            // To make an api call with SignUp data and take back user to Login Page
            new FlatButton(
                onPressed: () {
                  //api call to sign up the user or whatever
                  Navigator.of(context).pop();
                },
                child: new Text("SignUp")),
          ],
        ),
      ),
    );
  }
}