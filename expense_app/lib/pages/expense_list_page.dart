import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Expense App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 3,
              child: PieChartSample(),
            ),
            const Divider(
              color: Colors.red,
            ),
            const Text(
              "Hareketler",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 5,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: expenseList.length,
                itemBuilder: (context, index) {
                  var item = expenseList[index];
                  String date = DateFormat('yMd').format(item.date);
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    iconColor: Colors.black,
                    leading: checkIcons(item.category),
                    title: Text(
                      textAlign: TextAlign.center,
                      item.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      textAlign: TextAlign.center,
                      "${item.price}₺",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    trailing: Text(date),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

Icon checkIcons(Category category) {
  switch (category) {
    case Category.food:
      return const Icon(Icons.restaurant);
    case Category.education:
      return const Icon(Icons.cast_for_education);
    case Category.technology:
      return const Icon(Icons.computer);
    case Category.travel:
      return const Icon(Icons.travel_explore);
  }
}
