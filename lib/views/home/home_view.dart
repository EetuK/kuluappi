import 'package:flutter/material.dart';
import 'package:kuluappi/views/start/start_view.dart';
import 'package:kuluappi/widgets/BasicLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    const bool noExpenses = true;
    if (noExpenses) {
      return BasicLayout(
        body: Center(
          child: Text(
            'Home view',
            textScaleFactor: 2,
          ),
        ),
      );
    }
    return StartView();
  }
}
