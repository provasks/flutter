import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          toolbarHeight: 0.0,
        ),
        body: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(sizingInformation.info().loginBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: new Image.asset("${config.imagePath}/Schmersal_logo_white.png",

                          width: sizingInformation.info().imageWidth,
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: new Image.asset("${config.imagePath}/Tec.nicum_logo_white.png",

                          width: sizingInformation.info().imageWidth),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,50.0,0.0,30.0),
                    child: new Center(

                      child: Container(
                        // margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.fromLTRB(30.0,0.0,30.0,0.0),
                        width: sizingInformation.info().loginBoxSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: hexToColor('#00377B')),
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
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
