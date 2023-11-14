import 'package:expense_app/models/expense.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Activities extends StatelessWidget {
  const Activities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseModel>(
      builder: (context, value, child) => ListView.separated(
        padding: const EdgeInsets.all(5),
        cacheExtent: 0,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: value.expense.length,
        itemBuilder: (context, index) {
          var item = value.expense[index];
          String date = DateFormat('d/M/y').format(item.date);
          return Card(
            color: Colors.purple[100],
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.purple,
                ),
              ),
              iconColor: Colors.blueGrey,
              leading: categoryIcons[item.category],
              title: Text(
                textAlign: TextAlign.center,
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                textAlign: TextAlign.center,
                "${item.price}₺",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              trailing: Text(date),
            ),
          );
        },
      ),
    );
  }
}
