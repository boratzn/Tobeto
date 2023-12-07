import 'package:flutter/material.dart';
import 'package:meals_app/data/datas.dart';

import '../utils/utils.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

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
          for (var item in categories)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: boxDecoration(item),
                child: ListTile(
                  title: Text(item.name),
                  onTap: () {
                    openMealList(context, item);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
