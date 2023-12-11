import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(favoriteMealsProvider.notifier)
                    .toogleMealFavorite(widget.meal);
              },
              icon: Icon(favoriteMeals.contains(widget.meal)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined))
        ],
      ),
      body: Text(widget.meal.name),
    );
  }
}
