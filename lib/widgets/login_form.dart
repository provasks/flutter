import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schmersal_poc/models/login.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/ui/views/home_view.dart';
import 'package:schmersal_poc/utils/api.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import 'package:schmersal_poc/utils/validate.dart';
import 'package:schmersal_poc/widgets/styled_flat_button.dart';
import 'package:msal_mobile/msal_mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isSignedIn = false;
  bool isVisible = false;

  String token;
  SharedPreferences prefs;
  String clientId;
  String password;
  String message = '';

  _loadCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      token = (prefs.getString('userEmail') ?? "no");
      print(token);
      if (token.length > 3) {
        // Navigator.pushNamed(context, '/home');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
          (Route<dynamic> route) => false,
        );
      } else {
        isVisible = true;
      }
    });
  }

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // print('$clientId, $password');
      var authStr = 'domain=trianz||||username=' +
          '$clientId' +
          '||||password=' +
          '$password' +
          '';

      var bytes = utf8.encode(authStr);
      var base64Str = base64.encode(bytes);
      final response = await http.get(
          'https://authentication.trianz.com/api/authenticate/AuthenticateUserByCredential/' +
              base64Str); //+'ZG9tYWluPXRyaWFuenx8fHx1c2VybmFtZT1qYWdhZGVlc2gubWFydGh5fHx8fHBhc3N3b3JkPVNla2hhcjc2OCM=');
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = json.decode(response.body);
        if (data["isAuthenticated"]) {
          prefs.setString('userEmail', data["userEmail"]);
          prefs.setString('userFullName', data["userFullName"]);
          prefs.setString('designation', data["designation"]);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
            (Route<dynamic> route) => false,
          );
        } else {
          showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Error"),
              content: new Text("Please enter correct User Name and Password."),
              actions: [
                new FlatButton(
                  child: new Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
        return Login.fromJson(json.decode(response.body));
      } else {
        throw Exception('Unable to fetch User');
      }

    }
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();

  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,30.0,0.0,30.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image(image: AssetImage('${config.imagePath}/Mango_logo.png')),
              SizedBox(height: 40.0),
              TextFormField(
                decoration: Styles.input.copyWith(
                  hintText: 'Client ID',
                  prefixIcon: new Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 5, right: 0, bottom: 15),
                    child: new SizedBox(
                      height: 4,
                      child: Image.asset('${config.imagePath}/client_id.png'),
                    ),
                  ),
                ),
                style: Styles.p.copyWith(),
                validator: (value) {
                  clientId = value.trim();
                  return Validate.requiredField(value, "Client ID is required.");
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                obscureText: true,
                decoration: Styles.input.copyWith(
                  hintText: 'Password',
                  prefixIcon: new Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 0, right: 0, bottom: 0),
                    child: new SizedBox(
                      height: 4,
                      child: Image.asset('${config.imagePath}/password.png'),
                    ),
                  ),
                ),
                style: Styles.p.copyWith(),
                validator: (value) {
                  password = value.trim();
                  return Validate.requiredField(value, 'Password is required.');
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //   ),
              //   validator: (value) {
              //     email = value.trim();
              //     return Validate.validateEmail(value);
              //   },
              // ),
              // SizedBox(height: 15.0),
              // TextFormField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     hintText: 'Password',
              //   ),
              //   validator: (value) {
              //     password = value.trim();
              //     return Validate.requiredField(value, 'Password is required.');
              //   },
              // ),

              SizedBox(
                height: 15.0,
              ),
              StyledFlatButton(
                '  SIGN IN  ',

                onPressed: submit,
                // onPressed: handleSignIn,
              ),

              SizedBox(height: 20.0),

              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "For Reset passwords and New users please send your details admin team using below URL: ",
                        style: Styles.p,
                      ),
                      TextSpan(
                        text: " adminsupport@tecnicum.com",
                        style: Styles.p.copyWith(
                          color: hexToColor('#00377B'),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // TextSpan(
                      //   text: 'Register.',
                      //   style: Styles.p.copyWith(color: Colors.blue[500]),
                      //   recognizer: TapGestureRecognizer()
                      //     ..onTap = () => {
                      //       Navigator.pushNamed(context, '/signUp'),
                      //     },
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.0),

              Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text("Privacy Policy"),
                    new Text("All rights reserved"),
                  ],
                ),
              ),
              // SizedBox(height: 5.0),
              // Center(
              //   child: RichText(
              //     text: TextSpan(
              //       text: 'Forgot Your Password?',
              //       style: Styles.p.copyWith(color: Colors.blue[500]),
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () => {
              //            Navigator.pushNamed(context, '/password-reset'),
              //         }
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //_setToken() async {

  //}


}
