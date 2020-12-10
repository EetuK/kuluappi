import 'package:kuluappi/models/category_total_expense.dart';
import 'package:kuluappi/models/expense.dart';
import 'package:kuluappi/models/month.dart';
import 'package:kuluappi/views/home/widgets/charts/line_chart.dart';
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
  Month selectedMonth =
      Month.January; // Hard coded for now but whould be based on data

  @observable
  int selectedYear = 2020; // Hard coded for now

  @observable
  List<Month> availableMonths = [];

  @observable
  List<int> availableYears = [];

  @observable
  List<CategoryTotalExpense> categoryTotalExpenses = [];

  @computed
  num get totalExpenses =>
      categoryTotalExpenses.fold(0, (p, c) => p + c.totalExpenses);

  _ExpenseStoreBase() {
    reaction((_) => this.selectedMonth, (_) async {
      await this.fetchExpenses(selectedMonth, selectedYear);
      await this.fetchCategoryTotalExpenses(selectedMonth, selectedYear);
    });
    reaction((_) => this.selectedYear, (_) async {
      await this.fetchAvailableMonths(this.selectedYear);
      await this.fetchExpenses(selectedMonth, selectedYear);
      await this.fetchCategoryTotalExpenses(selectedMonth, selectedYear);
    });
  }

  @action
  void setMonth(Month month) {
    this.selectedMonth = month;
  }

  @action
  void setYear(int year) {
    this.selectedYear = year;
  }

  @action
  void addExpense() {}

  @action
  Future<void> fetchAvailableMonths(int year) async {
    this.isLoading = true;
    // Todo: Add error handling
    this.availableMonths = await getAvailableMonthsByYear(year);
    this.selectedMonth = this.availableMonths.first;
    print("Available months ${this.availableMonths.map((e) => e.index)}");
    this.isLoading = false;
  }

  @action
  Future<void> fetchAvailableYears() async {
    this.isLoading = true;
    // Todo: Add error handling
    this.availableYears = await getAvailableYears();
    this.selectedYear = this.availableYears.first;
    await this.fetchAvailableMonths(this.selectedYear);
    print("Available Years ${this.availableYears.map((e) => e)}");
    this.isLoading = false;
  }

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
  Future<void> fetchCategoryTotalExpenses(Month month, int year) async {
    this.isLoading = true;
    this.categoryTotalExpenses =
        await getCategoryTotalExpensesByYearAndMonth(month, year);

    print(this.categoryTotalExpenses.map(
        (e) => e.categoryName.toString() + " " + e.totalExpenses.toString()));
    this.isLoading = false;
  }

  @action
  void setExpenseDescription() {
    // Set this.expense.description
  }
}
