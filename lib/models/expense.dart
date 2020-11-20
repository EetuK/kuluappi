import 'package:kuluappi/services/database.dart';

class Expense {
  num id;
  num amount;
  String description;
  DateTime timestamp;
  num categoryId;

  Expense(num amount, String description, String timestamp, num categoryId) {
    this.amount = amount;
    this.description = description;
    this.timestamp = DateTime.tryParse(timestamp);
    this.categoryId = categoryId;
  }

  Expense.fromDb(Map<String, dynamic> map) {
    id = map['id'];
    amount = map['amount'];
    description = map['description'];
    timestamp = DateTime.tryParse(map['date_created']);
    categoryId = map['category_id'];
  }

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['amount'] = amount;
    map['description'] = description;
    map['timestamp'] = timestamp.toIso8601String();
    map['category_id'] = categoryId;
    return map;
  }
}

enum Month {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December
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
