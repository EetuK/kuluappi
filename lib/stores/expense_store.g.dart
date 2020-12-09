// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpenseStore on _ExpenseStoreBase, Store {
  Computed<num> _$totalExpensesComputed;

  @override
  num get totalExpenses =>
      (_$totalExpensesComputed ??= Computed<num>(() => super.totalExpenses,
              name: '_ExpenseStoreBase.totalExpenses'))
          .value;

  final _$expenseAtom = Atom(name: '_ExpenseStoreBase.expense');

  @override
  Expense get expense {
    _$expenseAtom.reportRead();
    return super.expense;
  }

  @override
  set expense(Expense value) {
    _$expenseAtom.reportWrite(value, super.expense, () {
      super.expense = value;
    });
  }

  final _$expensesAtom = Atom(name: '_ExpenseStoreBase.expenses');

  @override
  List<Expense> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(List<Expense> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ExpenseStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$selectedMonthAtom = Atom(name: '_ExpenseStoreBase.selectedMonth');

  @override
  Month get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(Month value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  final _$selectedYearAtom = Atom(name: '_ExpenseStoreBase.selectedYear');

  @override
  int get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(int value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  final _$availableMonthsAtom = Atom(name: '_ExpenseStoreBase.availableMonths');

  @override
  List<Month> get availableMonths {
    _$availableMonthsAtom.reportRead();
    return super.availableMonths;
  }

  @override
  set availableMonths(List<Month> value) {
    _$availableMonthsAtom.reportWrite(value, super.availableMonths, () {
      super.availableMonths = value;
    });
  }

  final _$availableYearsAtom = Atom(name: '_ExpenseStoreBase.availableYears');

  @override
  List<int> get availableYears {
    _$availableYearsAtom.reportRead();
    return super.availableYears;
  }

  @override
  set availableYears(List<int> value) {
    _$availableYearsAtom.reportWrite(value, super.availableYears, () {
      super.availableYears = value;
    });
  }

  final _$categoryTotalExpensesAtom =
      Atom(name: '_ExpenseStoreBase.categoryTotalExpenses');

  @override
  List<CategoryTotalExpense> get categoryTotalExpenses {
    _$categoryTotalExpensesAtom.reportRead();
    return super.categoryTotalExpenses;
  }

  @override
  set categoryTotalExpenses(List<CategoryTotalExpense> value) {
    _$categoryTotalExpensesAtom.reportWrite(value, super.categoryTotalExpenses,
        () {
      super.categoryTotalExpenses = value;
    });
  }

  final _$fetchAvailableMonthsAsyncAction =
      AsyncAction('_ExpenseStoreBase.fetchAvailableMonths');

  @override
  Future<void> fetchAvailableMonths(int year) {
    return _$fetchAvailableMonthsAsyncAction
        .run(() => super.fetchAvailableMonths(year));
  }

  final _$fetchAvailableYearsAsyncAction =
      AsyncAction('_ExpenseStoreBase.fetchAvailableYears');

  @override
  Future<void> fetchAvailableYears() {
    return _$fetchAvailableYearsAsyncAction
        .run(() => super.fetchAvailableYears());
  }

  final _$fetchExpensesAsyncAction =
      AsyncAction('_ExpenseStoreBase.fetchExpenses');

  @override
  Future<void> fetchExpenses(Month month, int year) {
    return _$fetchExpensesAsyncAction
        .run(() => super.fetchExpenses(month, year));
  }

  final _$fetchCategoryTotalExpensesAsyncAction =
      AsyncAction('_ExpenseStoreBase.fetchCategoryTotalExpenses');

  @override
  Future<void> fetchCategoryTotalExpenses(Month month, int year) {
    return _$fetchCategoryTotalExpensesAsyncAction
        .run(() => super.fetchCategoryTotalExpenses(month, year));
  }

  final _$_ExpenseStoreBaseActionController =
      ActionController(name: '_ExpenseStoreBase');

  @override
  void setMonth(Month month) {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setMonth');
    try {
      return super.setMonth(month);
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYear(int year) {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setYear');
    try {
      return super.setYear(year);
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addExpense() {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.addExpense');
    try {
      return super.addExpense();
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExpenseDescription() {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setExpenseDescription');
    try {
      return super.setExpenseDescription();
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expense: ${expense},
expenses: ${expenses},
isLoading: ${isLoading},
selectedMonth: ${selectedMonth},
selectedYear: ${selectedYear},
availableMonths: ${availableMonths},
availableYears: ${availableYears},
categoryTotalExpenses: ${categoryTotalExpenses},
totalExpenses: ${totalExpenses}
    ''';
  }
}
