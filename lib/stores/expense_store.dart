import 'package:kuluappi/models/expense.dart';
import 'package:kuluappi/models/month.dart';
import 'package:mobx/mobx.dart';
part 'expense_store.g.dart';

class ExpenseStore extends _ExpenseStoreBase with _$ExpenseStore {}

abstract class _ExpenseStoreBase with Store {
  @observable
  Expense expense;

  @observable
  List<Expense> expenses = [];

  @observable
  bool isLoading = false;

  @observable
  Month month = Month.January; // Hard coded for now but whould be based on data

  @observable
  int year = 2020; // Hard coded for now

  _ExpenseStoreBase() {
    reaction((_) => month, (_) => this.fetchExpenses(month, year));
    reaction((_) => year, (_) => this.fetchExpenses(month, year));
  }

  @action
  void setMonth(Month month) {
    this.month = month;
  }

  @action
  void setYear(int year) {
    this.year = year;
  }

  @action
  void addExpense() {}

  @action
  Future<void> fetchExpenses(Month month, int year) async {
    this.isLoading = true;
    // Todo: Add error handling
    this.expenses = await getExpensesByYearAndMonth(month, year);
    print(this
        .expenses
        .map((e) => e.description.toString() + " " + e.dateCreated.toString()));
    this.isLoading = false;
  }

  @action
  void setExpenseDescription() {
    // Set this.expense.description
  }
}
