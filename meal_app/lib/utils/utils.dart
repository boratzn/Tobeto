import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/repo/yemekler_dao_repo.dart';

import '../screens/meal_list.dart';

final yemeklerDao = YemeklerDaoRepository();

void openMealList(BuildContext context, CategoryElement item) {
  yemeklerDao
      .kategoriyeGoreYemekleriAl(item.strCategory)
      .then((value) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealList(
                meals: value,
                appBarTitle: item.strCategory,
              ),
            ),
          ));
}
