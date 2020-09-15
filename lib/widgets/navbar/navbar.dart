import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_desktop.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_mobile.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_tablet.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavbarMobile(),
      tablet: NavbarTablet(),
      desktop: NavbarDesktop(),
    );
  }
}