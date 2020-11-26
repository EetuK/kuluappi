// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpenseStore on _ExpenseStoreBase, Store {
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

  final _$monthAtom = Atom(name: '_ExpenseStoreBase.month');

  @override
  Month get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(Month value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  final _$yearAtom = Atom(name: '_ExpenseStoreBase.year');

  @override
  int get year {
    _$yearAtom.reportRead();
    return super.year;
  }

  @override
  set year(int value) {
    _$yearAtom.reportWrite(value, super.year, () {
      super.year = value;
    });
  }

  final _$fetchExpensesAsyncAction =
      AsyncAction('_ExpenseStoreBase.fetchExpenses');

  @override
  Future<void> fetchExpenses(Month month, int year) {
    return _$fetchExpensesAsyncAction
        .run(() => super.fetchExpenses(month, year));
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
month: ${month},
year: ${year}
    ''';
  }
}
