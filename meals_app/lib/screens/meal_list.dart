import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/meal_card.dart';

import '../models/meal.dart';

class MealList extends ConsumerWidget {
  const MealList({super.key, required this.meals, required this.appBarTitle});

  final List<Meal> meals;
  final String appBarTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget widget = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        var item = meals[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MealCard(meal: item),
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
