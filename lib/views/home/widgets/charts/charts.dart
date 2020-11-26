import 'package:flutter/material.dart';
import 'package:kuluappi/stores/expense_store.dart';
import 'package:kuluappi/views/home/widgets/charts/line_chart.dart';
import 'package:kuluappi/views/home/widgets/charts/pie_chart.dart';

class Charts extends StatelessWidget {
  final ExpenseStore expenseStore;
  const Charts({this.expenseStore});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  LineChartSample1(),
                  PieChartSample2()
                ],
              )))
    ]));
  }
}
