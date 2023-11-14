import 'package:expense_app/pages/expense_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/expense_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ExpenseModel(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Expense App",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const ExpenseListPage()),
    );
  }
}
