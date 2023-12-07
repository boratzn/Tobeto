import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealDetails(meal: meal),
              ));
        },
        child: Row(
          children: [Text(meal.name)],
        ),
      ),
    );
  }
}
