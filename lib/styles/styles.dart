import 'package:flutter/material.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';

class Styles {
  static TextStyle defaultStyle = TextStyle(color: Colors.grey[900]);

  static TextStyle h1 = defaultStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    height: 22 / 18,
  );

  static TextStyle p = defaultStyle.copyWith(
    fontSize: 14.0,
  );

  static TextStyle error = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.red,
  );

  static InputDecoration input = InputDecoration(
    filled: true,
    fillColor: hexToColor('#EAEEF9'),
    border: InputBorder.none,
    // border: OutlineInputBorder(
    //   borderRadius: new BorderRadius.circular(5.0),
    //   borderSide: BorderSide(color: Colors.red, width: .0),
    // ),

    // focusedBorder: InputBorder.none,
    // enabledBorder: InputBorder.none,
    // errorBorder: InputBorder.none,
    // disabledBorder: InputBorder.none,
    // contentPadding:
    //     EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
    // ),

    // hintText: 'Username',
    // contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: new BorderSide(color: Colors.white),
    //   borderRadius: new BorderRadius.circular(25.7),
    // ),
    // enabledBorder: UnderlineInputBorder(
    //   borderSide: new BorderSide(color: Colors.white),
    //   borderRadius: new BorderRadius.circular(25.7),
    // ),

    // fillColor: Colors.white,
    // focusColor: Colors.grey[900],
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.all(
    //     Radius.circular(12.0),
    //   ),
    //   borderSide: BorderSide(
    //     color: Colors.red,
    //     width: 2,
    //   ),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.all(
    //     Radius.circular(10.0),
    //   ),
    //   borderSide: BorderSide(
    //     color: Colors.red,
    //     width: 2,
    //   ),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Colors.blue,
    //     width: 2.0,
    //   ),
    // ),

    // border: OutlineInputBorder(
    //   gapPadding: 1.0,
    //   borderSide: BorderSide(
    //     color: Colors.grey[600],
    //     width: 0,
    //   ),
    // ),
    // hintStyle: TextStyle(
    //   color: Colors.grey[600],
    // ),
  );
}
