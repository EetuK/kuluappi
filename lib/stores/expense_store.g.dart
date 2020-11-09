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

  final _$_ExpenseStoreBaseActionController =
      ActionController(name: '_ExpenseStoreBase');

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
  void fetchExpenses() {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.fetchExpenses');
    try {
      return super.fetchExpenses();
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
expenses: ${expenses}
    ''';
  }
}
