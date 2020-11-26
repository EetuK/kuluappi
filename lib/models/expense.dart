import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/services/database.dart';

class Expense {
  num id;
  num amount;
  String description;
  DateTime dateCreated;
  num categoryId;

  Expense(num amount, String description, String dateCreated, num categoryId) {
    this.amount = amount;
    this.description = description;
    this.dateCreated = DateTime.tryParse(dateCreated);
    this.categoryId = categoryId;
  }

  Expense.fromDb(Map<String, dynamic> map) {
    id = map['id'];
    amount = map['amount'];
    description = map['description'];
    dateCreated = DateTime.tryParse(map['date_created']);
    categoryId = map['category_id'];
  }

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['amount'] = amount;
    map['description'] = description;
    map['timestamp'] = dateCreated.toIso8601String();
    map['category_id'] = categoryId;
    return map;
  }
}

// Here all the functions for Expense db operations e.g.

Future<int> createExpense(Expense expense) async {
  var client = await ExpenseDatabase().db;

  return client.insert('expenses', expense.toMapForDb());
}

Future<List<Expense>> getAllExpenses() async {
  var client = await ExpenseDatabase().db;
  var response = await client.rawQuery('SELECT * FROM expenses');
  print(response);
  return response.map((e) => Expense.fromDb(e)).toList();
}

Future<List<Expense>> getExpensesByYearAndMonth(Month month, int year) async {
  var monthNumber = getMonthNumber(month);

  var client = await ExpenseDatabase().db;

  var response = await client.rawQuery("""
        SELECT * FROM expenses 
        WHERE 
          CAST(strftime('%m',expenses.date_created) AS interger) = ? AND 
          CAST(strftime('%Y',expenses.date_created) AS integer) = ?
      
      """, [monthNumber, year]);

  return response.map((e) => Expense.fromDb(e)).toList();
}
