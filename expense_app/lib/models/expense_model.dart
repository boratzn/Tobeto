import 'package:flutter/material.dart';

import 'expense.dart';

class ExpenseModel extends ChangeNotifier {
  final List<Expense> _expense = [
    Expense(
      name: 'Domates',
      price: 100,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      name: 'Flutter Course',
      price: 250,
      category: Category.education,
      date: DateTime.now(),
    ),
    Expense(
      name: 'Ankara gezisi',
      price: 1500,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      name: 'Klavye',
      price: 1250,
      category: Category.technology,
      date: DateTime.now(),
    ),
  ];
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
