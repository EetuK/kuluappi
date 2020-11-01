import 'package:flutter/material.dart';
import 'package:kuluappi/widgets/BasicLayout.dart';

class StartView extends StatelessWidget {
  const StartView();

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      isMenuButtonShown: false,
      body: Center(
          child: Text(
        'Start view',
        textScaleFactor: 2,
      )),
    );
  }
}
