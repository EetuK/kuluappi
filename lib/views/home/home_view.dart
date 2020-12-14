import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/home/widgets/charts/charts.dart';
import 'package:kuluappi/views/home/widgets/content_toggle.dart';
import 'package:kuluappi/views/home/widgets/time_filter.dart';
import 'package:kuluappi/views/start/start_view.dart';
import 'package:kuluappi/widgets/BasicLayout.dart';
import 'package:kuluappi/views/home/widgets/listview.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);

    return Observer(
        builder: (_) => expenseStore.expenses.length > 0
            ? BasicLayout(
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
                      listWidget: Lists(),
                      chartWidget: Charts(),
                    ),
                  ],
                ),
              )))
            : StartView());
  }
}
