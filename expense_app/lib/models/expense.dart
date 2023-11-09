import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, education, travel, technology }

class Expense {
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;

  Expense({
    required this.name,
    required this.price,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
