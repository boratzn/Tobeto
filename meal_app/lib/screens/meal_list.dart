import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_app/repo/yemekler_dao_repo.dart';
import 'package:meal_app/screens/details.dart';

import '../models/meal.dart';

class MealList extends StatelessWidget {
  const MealList({super.key, required this.meals, required this.appBarTitle});

  final List<Meal> meals;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    Widget widget = GridView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        var item = meals[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealView(
                        idMeal: item.idMeal,
                        repository: YemeklerDaoRepository(),
                        appBarTitle: appBarTitle),
                  ));
            },
            child: Stack(
              children: [
                Image.network(item.strMealThumb),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.6),
                    ),
                    width: double.infinity,
                    height: 30,
                    child: Center(
                      child: Text(
                        item.strMeal,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
                .animate()
                .fade(begin: 0, end: 1, duration: const Duration(seconds: 1)),
          ),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride herhangi bir yiyecek bulunamadı."),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(appBarTitle),
      ),
      body: widget,
    );
  }
}
