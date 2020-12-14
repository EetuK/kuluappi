import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kuluappi/widgets/BasicLayout.dart';

class StartView extends StatelessWidget {
  const StartView();

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
        isMenuButtonShown: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Padding(
              child: Column(
                children: [
                  Text(
                    "Do you know where your money goes?",
                    textScaleFactor: 1.7,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed posuere interdum sem. Quisque ligula eros ullamcorper quis, lacinia quis facilisis sed sapien.",
                      textScaleFactor: 1.3,
                    ),
                    padding: EdgeInsets.only(top: 30),
                  )
                ],
              ),
              padding: EdgeInsets.only(left: 40, right: 40),
            ),
            SvgPicture.asset("images/ellipse.svg")
          ],
        ));
  }
}
