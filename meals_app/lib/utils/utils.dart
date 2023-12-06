import 'package:flutter/material.dart';

import '../data/datas.dart';
import '../models/category.dart';
import '../screens/meal_list.dart';

void openMealList(BuildContext context, Category item) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MealList(
        meals: meals.where((element) => element.categoryId == item.id).toList(),
        appBarTitle: item.name,
      ),
    ),
  );
}

BoxDecoration boxDecoration(Category category) {
  return BoxDecoration(
    gradient: LinearGradient(colors: [
      category.color.withOpacity(0.5),
      category.color.withOpacity(0.9)
    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
  );
}
