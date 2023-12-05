import 'package:flutter/material.dart';

import '../data/datas.dart';
import '../widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bir Kategori Seçin")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var item = categories[index];
          return CategoryCard(category: item);
        },
      ),
    );
  }
}
