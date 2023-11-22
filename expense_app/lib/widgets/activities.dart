import 'package:expense_app/models/expense.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              value.removeExpense(item);
              showTopSnackBar(
                  Overlay.of(context),
                  Stack(
                    children: [
                      const CustomSnackBar.success(
                        message: "Silme işlemi başarılı!",
                      ),
                      Positioned(
                        bottom: 15,
                        right: 5,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              value.addExpense(item);
                            },
                            child: Text("Geri Al")),
                      )
                    ],
                  ),
                  snackBarPosition: SnackBarPosition.bottom);
              /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Silme İşlemi Başarılı!"),
                action: SnackBarAction(
                  backgroundColor: Colors.blue,
                  label: "Geri Al",
                  onPressed: () {
                    value.addExpense(item);
                  },
                ),
              ));*/
            },
            child: Card(
              color: lightTheme.cardTheme.color,
              child: ListTile(
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
            ),
          );
        },
      ),
    );
  }
}
