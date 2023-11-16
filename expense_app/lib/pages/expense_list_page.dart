import 'package:expense_app/models/expense.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';
import '../widgets/activities.dart';

class ExpenseListPage extends StatefulWidget {
  const ExpenseListPage({super.key});

  @override
  State<ExpenseListPage> createState() => _ExpenseListPageState();
}

class _ExpenseListPageState extends State<ExpenseListPage> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final expModel = context.read<ExpenseModel>();
    DateTime? selectedDate;

    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PieChartSample(),
              Divider(
                color: Colors.purple,
              ),
              Text(
                "Hareketler",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: Activities()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  height: 410,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Hareket Ekle",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      //*********************AÇIKLAMA****************** */
                      TextField(
                        autofocus: true,
                        controller: _controllerTitle,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: "Açıklama",
                        ),
                      ),
                      //*********************MİKTAR********************** */
                      TextField(
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        controller: _controllerPrice,
                        decoration: const InputDecoration(
                          hintText: "Miktar",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          labelText: "Miktar",
                        ),
                      ),
                      //*********************TARİH SEÇİMİ****************************
                      Row(
                        children: [
                          const Text(
                            "Tarih seçiniz: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controllerDate,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      color: Colors.purple,
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        final DateTime? dt =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100));

                                        if (dt != null) {
                                          expModel.selectedDate = dt;
                                          _controllerDate.text = DateFormat(
                                                  'd/M/y')
                                              .format(expModel.selectedDate!)
                                              .toString();
                                        }
                                      },
                                      icon: const Icon(Icons.date_range)),
                                  //enabled: false,
                                  labelText: "Seçilen Tarih",
                                  hintText: selectedDate.toString()),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          //*********************KATEGORİ SEÇİMİ****************************
                          const Text("Kategori: ",
                              style: TextStyle(fontSize: 16)),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(
                                        color: Colors.purple,
                                      ))),
                              isExpanded: true,
                              items: categories,
                              value: expModel.category,
                              onChanged: (value) {
                                expModel.category = value;
                              },
                            )),
                          ),
                        ],
                      ),
                      //*******************KAYDET BUTONU********************** */
                      ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.purple)),
                          onPressed: () {
                            expModel.addExpense(Expense(
                              name: _controllerTitle.text,
                              price: double.parse(_controllerPrice.text),
                              date: selectedDate ?? DateTime.now(),
                              category: expModel.category,
                            ));
                            Navigator.pop(context);
                            _controllerTitle.clear();
                            _controllerPrice.clear();
                            _controllerDate.clear();
                          },
                          child: const Text(
                            "Kaydet",
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
