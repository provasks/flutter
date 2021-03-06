import 'package:flutter/material.dart';
import 'package:schmersal_poc/styles/styles.dart';
import 'package:schmersal_poc/utils/ui_utils.dart';


class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double radius;

  const StyledFlatButton(this.text, {this.onPressed, Key key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: hexToColor('#00377B'),
      // splashColor: Colors.blue[200],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          this.text,
          style: Styles.p.copyWith(
            color: Colors.white,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
        side: BorderSide(
          color: hexToColor('#00377B'),
          width: 2,
        ),
      ),
    );
  }
}