import 'package:flutter/material.dart';
import 'package:schmersal_poc/enums/device_types.dart';

class NavbarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Image.asset('${config.imagePath}/Mango_logo.png'),

    );
  }
}