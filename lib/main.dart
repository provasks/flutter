import 'package:flutter/material.dart';
import 'package:schmersal_poc/ui/views/client_list_view.dart';
import 'package:schmersal_poc/ui/views/home_view.dart';
import 'package:schmersal_poc/ui/views/login_view.dart';
import 'package:schmersal_poc/ui/views/project_list_view.dart';

void main() {
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

// import 'package:flutter/material.dart';
// import 'package:msal_mobile/msal_mobile.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   static const String SCOPE = 'api://682ef78e-6ef1-4c91-a257-2afcae597d78/user_impersonation';
//   static const String TENANT_ID = 'Z02~mfs2y_V4c7ZuRms_CQ.5jy7B2JAnPs';
//   static String authority = "https://login.microsoftonline.com/$TENANT_ID";

//   MsalMobile msal;
//   bool isSignedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     MsalMobile.create('auth_config.json', authority).then((client) {
//       setState(() {
//         msal = client;
//       });
//       refreshSignedInStatus();
//     });
//   }

//   /// Updates the signed in state
//   refreshSignedInStatus() {
//     msal.getSignedIn().then((loggedIn) {
//       print('refreshing');
//       setState(() {
//         isSignedIn = loggedIn;
//       });
//     });
//   }

//   logMsalMobileError(MsalMobileException exception) {
//     print('${exception.errorCode}: ${exception.message}');
//     if (exception.innerException != null) {
//       print('inner exception = ${exception.innerException.errorCode}: ${exception.innerException.message}');
//     }
//   }

//   /// Signs a user in
//   handleSignIn() async {
//     await msal.signIn(null, [SCOPE]).then((result) {
//       refreshSignedInStatus();
//     }).catchError((exception) {
//       if (exception is MsalMobileException) {
//         logMsalMobileError(exception);
//       } else {
//         final ex = exception as Exception;
//         print('exception occurred');
//         print(ex.toString());
//       }
//     });
//   }

//   /// Gets a token silently unless the interactive experience is required.
//   handleGetToken() async {
//     // you would use this instead to auth for all organizations: "https://login.microsoftonline.com/common"
//     await msal.acquireToken([SCOPE], authority).then((result) {
//       print('access token (truncated): ${result.accessToken}');
//     }).catchError((exception) {
//       if (exception is MsalMobileException) {
//         logMsalMobileError(exception);
//       } else {
//         print('exception occurred');
//       }
//     });
//   }

//   /// Get a token interactively.
//   handleGetTokenInteractively() async {
//     await msal.acquireTokenInteractive([SCOPE]).then((result) {
//       print('access token (truncated): ${result.accessToken}');
//     }).catchError((exception) {
//       if (exception is MsalMobileException) {
//         logMsalMobileError(exception);
//       } else {
//         final ex = exception as Exception;
//         print('exception occurred');
//         print(ex.toString());
//       }
//     });
//   }

//   /// Gets a token silently.
//   handleGetTokenSilently() async {
//     String authority = "https://login.microsoftonline.com/$TENANT_ID";
//     // you would use this instead to auth for all organizations: "https://login.microsoftonline.com/common"
//     await msal.acquireTokenSilent([SCOPE], authority).then((result) {
//       print('access token (truncated): ${result.accessToken}');
//     }).catchError((exception) {
//       if (exception is MsalMobileException) {
//         logMsalMobileError(exception);
//       } else {
//         print('exception occurred');
//       }
//     });
//   }

//   /// Signs a user out.
//   handleSignOut() async {
//     try {
//       print('signing out');
//       await msal.signOut();
//       print('signout done');
//       refreshSignedInStatus();
//     } on MsalMobileException catch (exception) {
//       logMsalMobileError(exception);
//     }
//   }

//   /// Gets the current and prior accounts.
//   handleGetAccount() async {
//     await msal.getAccount().then((result) {
//       if (result.currentAccount != null) {
//         print('current account id: ${result.currentAccount.id}');
//       } else {
//         print('no account found');
//       }
//     }).catchError((exception) {
//       if (exception is MsalMobileException) {
//         logMsalMobileError(exception);
//       } else {
//         print('exception occurred');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('MSAL Mobile'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               isSignedIn
//                   ? RaisedButton(
//                       child: Text("Sign Out"),
//                       onPressed: handleSignOut,
//                     )
//                   : RaisedButton(
//                       child: Text("Sign In"),
//                       onPressed: handleSignIn,
//                     ),
//               RaisedButton(
//                 child: Text("Get Token (Silent unless UI needed)"),
//                 onPressed: handleGetToken,
//               ),
//               RaisedButton(
//                 child: Text("Get Token Interactive"),
//                 onPressed: handleGetTokenInteractively,
//               ),
//               RaisedButton(
//                 child: Text("Get Token Silent"),
//                 onPressed: handleGetTokenSilently,
//               ),
//               RaisedButton(
//                 child: Text("Get Account"),
//                 onPressed: handleGetAccount,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


