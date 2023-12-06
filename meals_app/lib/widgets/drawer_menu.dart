import 'package:flutter/material.dart';
import 'package:meals_app/data/datas.dart';

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
              color: Colors.grey,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                ),
                Text(
                  "User 1",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ),
          for (var item in categories)
            ListTile(title: Text(item.name), onTap: () {})
        ],
      ),
    );
  }
}
