import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../constants/constants.dart';

const uuid = Uuid();

enum Category { food, education, travel, technology }

const categoryColor = {
  Category.food: AppColors.contentColorYellow,
  Category.education: Colors.red,
  Category.travel: AppColors.contentColorGreen,
  Category.technology: AppColors.contentColorPurple,
};

const categoryIcons = {
  Category.food: Icon(
    Icons.restaurant,
    color: AppColors.contentColorYellow,
  ),
  Category.education: Icon(
    Icons.school,
    color: Colors.red,
  ),
  Category.travel: Icon(
    Icons.flight,
    color: AppColors.contentColorGreen,
  ),
  Category.technology: Icon(
    Icons.computer,
    color: AppColors.contentColorPurple,
  ),
};

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
