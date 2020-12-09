import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/home/widgets/charts/line_chart.dart';
import 'package:provider/provider.dart';

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);

    return Observer(
        builder: (_) => Center(
                child: Column(children: [
              Card(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Summary",
                                  textScaleFactor: 1.5,
                                ),
                                Column(
                                  children: [
                                    Text("Total",
                                        textScaleFactor: 0.9,
                                        style:
                                            TextStyle(color: Colors.black38)),
                                    Text(
                                      '${expenseStore.totalExpenses.toString()}€',
                                      textScaleFactor: 1.4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black12, width: 1))),
                          ),
                          Container(
                              height: (30 +
                                          expenseStore.categoryTotalExpenses
                                                  .length *
                                              60)
                                      .toDouble() ??
                                  100.0,
                              child: expenseStore.categoryTotalExpenses.length >
                                      0
                                  ? HorizontalBarChartWithSecondaryAxis(
                                      categoryExpensesList:
                                          expenseStore.categoryTotalExpenses)
                                  : Container())
                        ],
                      )))
            ])));
  }
}
