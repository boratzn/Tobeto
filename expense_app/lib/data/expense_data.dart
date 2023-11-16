import '../models/expense.dart';

List<Expense> expenseList = [
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
