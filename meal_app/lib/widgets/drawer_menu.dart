import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/utils/utils.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.categories});

  final List<CategoryElement> categories;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/Cook.jpg"), fit: BoxFit.cover),
                color: Colors.brown,
              ),
              child: null,
            ),
          ),
          for (var category in categories)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  title: Text(category.strCategory),
                  onTap: () => openMealList(context, category),
                ),
              ),
            )
        ],
      ),
    );
  }
}
