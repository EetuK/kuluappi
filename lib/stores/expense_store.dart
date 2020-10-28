import 'package:kuluappi/models/expense.dart';
import 'package:mobx/mobx.dart';
part 'expense_store.g.dart';

class ExpenseStore extends _ExpenseStoreBase with _$ExpenseStore {}

abstract class _ExpenseStoreBase with Store {
  @observable
  Expense expense;

  @observable
  List<Expense> expenses;

  @action
  void fetchExpenses() {
    // Fetch list of expenses
  }

  @action
  void setExpenseDescription() {
    // Set this.expense.description
  }
}
