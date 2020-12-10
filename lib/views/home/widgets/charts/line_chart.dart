/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:kuluappi/models/category_total_expense.dart';

class HorizontalBarChartWithSecondaryAxis extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<CategoryTotalExpense> categoryExpensesList;

  HorizontalBarChartWithSecondaryAxis({this.categoryExpensesList});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _fromExpensesData(this.categoryExpensesList),
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 0)),
      secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
              new charts.BasicNumericTickProviderSpec(desiredTickCount: 0)),
      defaultRenderer: new charts.BarRendererConfig(
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        cornerStrategy: const charts.ConstCornerStrategy(10),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<CategoryTotalExpense, String>> _fromExpensesData(
      List<CategoryTotalExpense> values) {
    final globalSalesData = [...values];

    var series = new charts.Series<CategoryTotalExpense, String>(
        id: 'Expenses',
        domainFn: (CategoryTotalExpense category, _) => category.categoryName,
        measureFn: (CategoryTotalExpense category, _) => category.totalExpenses,
        data: globalSalesData,
        seriesColor: charts.Color.fromHex(code: "#EF5350"),
        labelAccessorFn: (CategoryTotalExpense category, _) =>
            '${category.totalExpenses.toString()}€');

    return [
      series,
    ];
  }
}

/// Sample ordinal data type.
