import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:meals_app/utils/utils.dart';

import '../models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openMealList(context, category);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: boxDecoration(category),
        child: Text(category.name),
      ).animate().fade(begin: 0, end: 1, duration: const Duration(seconds: 1)),
    );
  }
}
