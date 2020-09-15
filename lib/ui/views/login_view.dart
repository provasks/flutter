import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/widgets/login_form.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';
import '../base_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  sizingInformation.info().loginBackgroundImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                // margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(30.0),
                width: sizingInformation.info().loginBoxSize,
                height: 535,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: hexToColor('#00377B')),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: new LogInForm(),
              ),

              // child: Column(
              //   children: [
              //     Padding(padding: EdgeInsets.only(top: 140.0)),
              //     Text(
              //       'Beautiful Flutter TextBox',
              //       style: TextStyle(
              //           color: hexToColor("#F2A03D"), fontSize: 25.0),
              //     ),
              //     Padding(padding: EdgeInsets.only(top: 50.0)),
              //     TextFormField(
              //       decoration: InputDecoration(
              //         labelText: "Enter Email",
              //         fillColor: Colors.white,
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(25.0),
              //           borderSide: BorderSide(),
              //         ),
              //         //fillColor: Colors.green
              //       ),
              //       validator: (val) {
              //         if (val.length == 0) {
              //           return "Email cannot be empty";
              //         } else {
              //           return null;
              //         }
              //       },
              //       keyboardType: TextInputType.emailAddress,
              //       style: TextStyle(
              //         fontFamily: "Poppins",
              //       ),
              //     ),
              //   ],
              // ),

              // child: SignUp(),
              // child: Text(
              //   'Set Full Screen Background Image in Flutter',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       color: Colors.brown,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold,
              //       borderWidth: 1),
              // ),
            ),
          ),
        ),
      );
    });
  }
}
