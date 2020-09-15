import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import 'package:schmersal_poc/utils/validate.dart';
import 'package:schmersal_poc/widgets/styled_flat_button.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String clientId;
  String password;
  String message = '';

  Future<void> submit() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // print('$clientId, $password');
      Navigator.pushNamed(context, '/home');
      // await Provider.of<AuthProvider>(context).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(height: 10.0),
          // Consumer<AuthProvider>(
          //   builder: (context, provider, child) => provider.notification ?? NotificationText(''),
          // ),
          // SizedBox(height: 30.0),

          Image(image: AssetImage('assets/images/tec.nicum_logo.png')),
          SizedBox(height: 40.0),
          TextFormField(
            decoration: Styles.input.copyWith(
              hintText: 'Client ID',
              prefixIcon: new Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 5, right: 0, bottom: 15),
                child: new SizedBox(
                  height: 4,
                  child: Image.asset('assets/images/Client ID.png'),
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
                  child: Image.asset('assets/images/password.png'),
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

          SizedBox(height: 15.0),
          StyledFlatButton(
            'Sign In',
            onPressed: submit,
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
    );
  }
}
