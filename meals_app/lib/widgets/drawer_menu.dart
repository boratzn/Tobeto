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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.brown,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 45,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "User 1",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
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
            )
        ],
      ),
    );
  }
}

/*
ListTile(
                tileColor: item.color,
                title: Text(item.name),
                onTap: () {
                  openMealList(context, item);
                },
              )

 */