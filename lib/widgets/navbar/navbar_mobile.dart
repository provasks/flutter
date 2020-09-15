import 'package:flutter/material.dart';
import 'package:schmersal_poc/widgets/navbar/nav_drawer/side_drawer.dart';
import 'package:schmersal_poc/widgets/navbar/navbar_logo.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text("Hello"),
    //         NavbarLogo(),
    //       ],
    //     ),
    //   ),
    //   // drawer: SideDrawer(),
    //   // body: Container(
    //   //   height: 80,
    //   //   padding: EdgeInsets.all(10.0),
    //   //   child: Center(
    //   //     child: Column(
    //   //       mainAxisAlignment: MainAxisAlignment.center,
    //   //       children: [
    //   //         Text("Hello"),
    //   //         NavbarLogo(),
    //   //       ],
    //   //     ),
    //   //   ),
    //   // ),
    // );
    return Container(
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // drawer: SideDrawer(),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                NavbarLogo()
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(left:20.0, right: 20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       Container(
          //         width: 25.0,
          //         margin: EdgeInsets.only(right: 8.0),
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black, width: 1),
          //           color: Colors.white,
          //           shape: BoxShape.circle,
          //         ),
          //         child: IconButton(
          //           iconSize: 4,
          //           icon: Image.asset('assets/images/Language.png'),
          //           onPressed: () {},
          //         ),
          //       ),
          //       IconButton(
          //         padding: EdgeInsets.zero,
          //         constraints: BoxConstraints(),
          //         // iconSize: 40,
          //         icon: Image.asset('assets/images/User Profile.png'),
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
