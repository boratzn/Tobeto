import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meal_app/utils/utils.dart';

import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryElement category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openMealList(context, category);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(),
              image: DecorationImage(
                image: NetworkImage(
                  category.strCategoryThumb,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              category.strCategory,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
            .animate()
            .fade(begin: 0, end: 1, duration: const Duration(seconds: 1)),
      ),
    );
  }
}
