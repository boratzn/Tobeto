import 'package:flutter/material.dart';

import '../data/expense_data.dart';
import 'expense.dart';

class ExpenseModel extends ChangeNotifier {
  final List<Expense> _expense = expenseList;
  Category _category = Category.education;
  DateTime? _selectedDate;

  List<Expense> get expense => _expense.reversed.toList();
  Category get category => _category;
  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  set category(Category value) {
    _category = value;
    notifyListeners();
  }

  void addExpense(Expense expense) {
    _expense.add(expense);
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    _expense.remove(expense);
    notifyListeners();
  }
}
