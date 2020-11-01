import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  TopBar({this.onMenuPress, this.isMenuButtonShown = true});

  // Fields in a Widget subclass are always marked "final".

  final VoidCallback onMenuPress;
  final bool isMenuButtonShown;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // mainAxisAlignment
        children: <Widget>[
          SvgPicture.asset("images/logo.svg"),
          if (isMenuButtonShown == true)
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Open menu',
              onPressed: () => onMenuPress(),
            ),
        ],
      ),
      color: Color(0xf6ddb8),
      alignment: Alignment(-1.0, -1.0),
      margin: EdgeInsets.only(top: statusBarHeight),
    );
  }
}
