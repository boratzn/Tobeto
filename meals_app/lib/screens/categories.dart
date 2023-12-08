import 'package:flutter/material.dart';
import 'package:meals_app/screens/favorites.dart';
import 'package:meals_app/widgets/drawer_menu.dart';

import '../data/datas.dart';
import '../widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text("Bir Kategori Seçin"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Favorites(),
                        ));
                  },
                  icon: Icon(Icons.favorite)))
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var item = categories[index];
          return CategoryCard(category: item);
        },
      ),
    );
  }
}
