import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/home/widgets/charts/line_chart.dart';
import 'package:kuluappi/views/home/widgets/charts/pie_chart.dart';
import 'package:provider/provider.dart';

class Charts extends StatelessWidget {
  final ExpenseStore expenseStore;
  const Charts({this.expenseStore});

  @override
  Widget build(BuildContext context) {
    final expenseStore = Provider.of<ExpenseStore>(context);

    return Center(
        child: Card(
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
                            "Yhteenveto",
                            textScaleFactor: 1.5,
                          ),
                          Column(
                            children: [
                              Text("Kokonaiskulut",
                                  textScaleFactor: 0.8,
                                  style: TextStyle(color: Colors.black38)),
                              Text(
                                "-900€",
                                textScaleFactor: 1.4,
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1))),
                    ),
                    Observer(
                      builder: (_) => Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            ...expenseStore.expenses
                                .map((e) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(e.id.toString()),
                                          Text(e.description),
                                          Text(e.amount.toString()),
                                        ]))
                                .toList(),
                            MaterialButton(
                              child: Text("Lisää kulu"),
                              onPressed: () => expenseStore.addExpense(),
                            ),
                          ])),
                    ),
                    LineChartSample1(),
                    PieChartSample2()
                  ],
                ))));
  }
}
