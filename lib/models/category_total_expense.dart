import 'dart:math';

import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/services/database.dart';

double roundDouble(double value, int places) {
  double mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

class CategoryTotalExpense {
  String categoryName;
  double totalExpenses;

  CategoryTotalExpense(this.categoryName, this.totalExpenses);

  CategoryTotalExpense.fromDb(Map<String, dynamic> map) {
    this.categoryName = map['category_name'];
    this.totalExpenses = roundDouble(map['total_expenses'], 2);
  }
}

Future<List<CategoryTotalExpense>> getCategoryTotalExpensesByYearAndMonth(
    Month month, int year) async {
  var monthNumber = getMonthNumber(month);

  var client = await ExpenseDatabase().db;

  var response = await client.rawQuery("""
        SELECT categories.name AS category_name, SUM(expenses.sum) AS total_expenses FROM expenses
          LEFT JOIN categories ON
            categories.id = expenses.category_id
        WHERE 
          CAST(strftime('%m',expenses.date_created) AS interger) = ? AND 
          CAST(strftime('%Y',expenses.date_created) AS integer) = ?
        GROUP BY categories.name
      
      """, [monthNumber, year]);

  return response.map((e) => CategoryTotalExpense.fromDb(e)).toList();
}
