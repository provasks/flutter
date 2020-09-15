// Forgot Password page
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Sign Up"),

            // Make api call to resend password and take user back to Login Page
            new FlatButton(
                onPressed: () {
                  //api call to reset password or whatever
                  Navigator.of(context).pop();
                },
                child: new Text("Resend Passcode")),
          ],
        ),
      ),
    );
  }
}