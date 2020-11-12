import 'package:flutter/material.dart';
import 'package:kuluappi/views/home/widgets/charts/charts.dart';
import 'package:kuluappi/views/home/widgets/content_toggle.dart';
import 'package:kuluappi/views/home/widgets/time_filter.dart';
import 'package:kuluappi/views/start/start_view.dart';
import 'package:kuluappi/widgets/BasicLayout.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    const bool hasExpenses = true;

    if (hasExpenses) {
      return BasicLayout(
          body: SingleChildScrollView(
              child: Container(
        margin: EdgeInsets.only(top: 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimeFilter(),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),
            ContentToggle(
              listWidget: Text("list widget"),
              chartWidget: Charts(),
            ),
          ],
        ),
      )));
    }
    return StartView();
  }
}
