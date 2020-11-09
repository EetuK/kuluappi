class Expense {
  num id;
  num amount;
  String description;
  String timestamp;
  num categoryId;

  Expense(num id, num amount, String description, String timestamp,
      num categoryId) {
    this.id = id;
    this.amount = amount;
    this.description = description;
    this.timestamp = timestamp;
    this.categoryId = categoryId;
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

Future<Expense> getExpenseById(num id) {}

Future<List<Expense>> getExpensesByMonth(Month month) {
  // ...
}
