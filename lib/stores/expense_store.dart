import 'package:kuluappi/models/expense.dart';
import 'package:mobx/mobx.dart';
part 'expense_store.g.dart';

class ExpenseStore extends _ExpenseStoreBase with _$ExpenseStore {}

abstract class _ExpenseStoreBase with Store {
  @observable
  Expense expense;

  @observable
  List<Expense> expenses = [];

  @action
  void addExpense() {}

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
