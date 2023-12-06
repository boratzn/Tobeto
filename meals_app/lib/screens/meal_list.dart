import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealList extends StatelessWidget {
  const MealList({super.key, required this.meals, required this.appBarTitle});

  final List<Meal> meals;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    Widget widget = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        var item = meals[index];
        return Container(
          child: Text(item.name),
        );
      },
    );

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride herhangi bir yiyecek bulunamadı."),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: widget,
    );
  }
}
