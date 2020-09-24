import 'package:flutter/material.dart';
import 'package:schmersal_poc/ui/views/client_list_view.dart';
import 'package:schmersal_poc/ui/views/home_view.dart';
import 'package:schmersal_poc/ui/views/login_view.dart';
import 'package:schmersal_poc/ui/views/project_list_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SchmersalApp());
}

class SchmersalApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tec.nicum',
            // Routes
      routes: <String, WidgetBuilder>{
        '/': (_) => new LoginView(), // Login Page
        // '/signUp': (_) => new SignUp(), // The SignUp page
        // '/forgotPassword': (_) => new ForgotPassword(), // Forgot Password Page
        '/projects': (_) => new ProjectList(),
        '/home': (_) => new HomeView(),
        '/clients': (_) => new ClientList(),

      },
    );
  }
}

// const String TENANT_ID = 'e822651b-5027-4253-83f5-904854601a3b';
// const String authority = "https://login.microsoftonline.com/$TENANT_ID";
// // **directory settings:**
// const String clientId = '682ef78e-6ef1-4c91-a257-2afcae597d78';
// // const String authority = '';
// const List<String> scopes = [
//   'api://682ef78e-6ef1-4c91-a257-2afcae597d78/user_impersonation/user-impersonation'
// ];

// void main() {
//   // Create an MSAL logger
//   final logger = Logger(
//     _loggerCallback,
//     LoggerOptions()
//       // Log everything for the purpose of this demo
//       ..level = LogLevel.verbose,
//   );

//   // Create an MSAL UserAgentApplication
//   final userAgentApplication = UserAgentApplication(
//     Configuration()
//       ..auth = (AuthOptions()
//         ..clientId = clientId
//         ..authority = authority)
//       ..system = (SystemOptions()..logger = logger),
//   );

//   // Setup a callback for the redirect login flow
//   //
//   // **IMPORTANT NOTE:** It is highly recommended to setup
//   // your UserAgentApplication and call handleRedirectCallback
//   // sometime before your Flutter app starts. The router in
//   // the [MaterialApp] widget will clear the URL when it loads
//   // which will prevent MSAL from getting the token from it
//   // after a redirect login.
//   userAgentApplication.handleRedirectCallback(_redirectCallback);

//   // Start the Flutter app
//   runApp(MyApp(userAgentApplication: userAgentApplication));
// }

// void _loggerCallback(LogLevel level, String message, bool containsPii) {
//   // MSAL log message
//   print('MSAL: [$level] $message');
// }

// void _redirectCallback(AuthException error, [AuthResponse response]) {
//   if (error != null) {
//     // Redirect login failed
//     print('MSAL: ${error.errorCode}:${error.errorMessage}');
//   } else {
//     // Redirect login succeeded
//     print('Redirect login successful. name: ${response.account.name}');
//   }
// }

// /// Simple default Flutter app.
// ///
// /// Passes the [UserAgentApplication] onto the home page.
// class MyApp extends StatelessWidget {
//   final UserAgentApplication userAgentApplication;

//   MyApp({@required this.userAgentApplication});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Web MSAL.js Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(userAgentApplication: userAgentApplication),
//     );
//   }
// }

// /// The demo home page for interacting with the
// /// MSAL [UserAgentApplication].
// class MyHomePage extends StatefulWidget {
//   final UserAgentApplication userAgentApplication;

//   MyHomePage({
//     @required this.userAgentApplication,
//     Key key,
//   }) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Account _account;

//   @override
//   void initState() {
//     super.initState();

//     // Get the currently authenticated account, if any.
//     //
//     // After a redirect login, this returns the logged in account.
//     _account = widget.userAgentApplication.getAccount();
//   }

//   /// Starts a redirect login.
//   void _loginRedirect() {
//     widget.userAgentApplication.loginRedirect(AuthRequest()..scopes = scopes);
//   }

//   /// Starts a popup login.
//   Future<void> _loginPopup() async {
//     try {
//       final response = await widget.userAgentApplication
//           .loginPopup(AuthRequest()..scopes = scopes);

//       setState(() {
//         _account = response.account;
//       });

//       print('Popup login successful. name: ${response.account.name}');
//     } on AuthException catch (ex) {
//       print('MSAL: ${ex.errorCode}:${ex.errorMessage}');
//     }
//   }

//   /// Logs the current account out.
//   void _logout() {
//     widget.userAgentApplication.logout();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Web MSAL.js Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_account == null) ...[
//               RaisedButton(
//                 child: Text('Login Redirect'),
//                 onPressed: _loginRedirect,
//               ),
//               RaisedButton(
//                 child: Text('Login Popup'),
//                 onPressed: _loginPopup,
//               ),
//             ],
//             if (_account != null) ...[
//               Text('Signed in as ${_account.name}'),
//               RaisedButton(
//                 child: Text('Logout'),
//                 onPressed: _logout,
//               ),
//             ]
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   // Important note about the below 'options' objects:
//   //
//   // To set an option to `undefined`, simply don't call
//   // the setter for that option at all. This will let
//   // msal.js use the option's default value. Setting an
//   // option to `null` will not use its default value.

//   // Create an MSAL logger (optional)
//   // var logger = Logger(
//   //   _loggerCallback,
//   //   LoggerOptions()..level = LogLevel.verbose, // log everything
//   // );

//   // Configure and create an MSAL authentication context
//   // Note: Only clientId is required
//   var config = Configuration()
//     ..auth = (AuthOptions()..clientId = clientId);

//   var userAgentApplication = UserAgentApplication(config);
//   //   // Create an MSAL UserAgentApplication
//   // final userAgentApplication = UserAgentApplication(
//   //   Configuration()
//   //     ..auth = (AuthOptions()
//   //       ..clientId = clientId
//   //       ..authority = authority)
//   //     ..system = (SystemOptions()..logger = logger),
//   // );


//   // If you plan on using the redirect flow, register a callback
//   userAgentApplication.handleRedirectCallback(_authCallback);

//   // Login by calling either:
//   // - userAgentApplication.loginRedirect
//   // - userAgentApplication.loginPopup

//   // After login, acquire an access token by calling:
//   // userAgentApplication.acquireTokenSilent

//   // If acquiring the token silently fails, use either:
//   // - userAgentApplication.acquireTokenRedirect
//   // - userAgentApplication.acquireTokenPopup

//   // See the msal.js documentation for more information.
// }

// void _loggerCallback(LogLevel level, String message, bool containsPii) {
//   print('[$level] $message');
// }

// void _authCallback(AuthException error, [AuthResponse response]) {
//   // ...
// }