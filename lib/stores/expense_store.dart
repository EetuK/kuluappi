import 'package:kuluappi/models/expense.dart';
import 'package:mobx/mobx.dart';
part 'expense_store.g.dart';

class ExpenseStore extends _ExpenseStoreBase with _$ExpenseStore {}

abstract class _ExpenseStoreBase with Store {
  @observable
  Expense expense;

  @observable
  List<Expense> expenses = [
    Expense(1, 15, "Beer", "timestamp", 1),
    Expense(2, 40, "Food", "timestamp", 1),
    Expense(3, 23, "Gas", "timestamp", 2)
  ];

  @action
  void addExpense() {
    this.expenses = [
      ...this.expenses,
      Expense(this.expenses[this.expenses.length - 1].id + 1, 23, "Gas",
          "timestamp", 2)
    ];
  }

  @action
  void fetchExpenses() {
    // Fetch list of expenses
    //fetchExpensesByMonth(month)
  }

  @action
  void setExpenseDescription() {
    // Set this.expense.description
  }
}
