import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../models/expense.dart';
import 'indicator.dart';

class PieChartSample extends StatefulWidget {
  const PieChartSample({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

late List<Expense> expList;

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseModel>(
      builder: (context, value, child) {
        expList = value.expense;
        return AspectRatio(
          aspectRatio: 1.6,
          child: Row(
            children: [
              const SizedBox(
                height: 18,
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Indicator(
                    color: Colors.red,
                    text: Category.education.name,
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.contentColorYellow,
                    text: Category.food.name,
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.contentColorPurple,
                    text: Category.technology.name,
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.contentColorGreen,
                    text: Category.travel.name,
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: selectCategory(Category.education),
            title: '${selectCategory(Category.education)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: selectCategory(Category.food),
            title: '${selectCategory(
              Category.food,
            )}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: selectCategory(Category.technology),
            title: '${selectCategory(Category.technology)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: selectCategory(Category.travel),
            title: '${selectCategory(Category.travel)}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

double selectCategory(Category category) {
  Map<Category, double> getCategoryPrice = {};
  double totalPrice = 0;

  for (var item in expList) {
    if (getCategoryPrice.containsKey(item.category)) {
      double temp = getCategoryPrice[item.category]!;
      getCategoryPrice[item.category] = temp + item.price;
    } else {
      getCategoryPrice[item.category] = item.price;
    }
    totalPrice += item.price;
  }

  switch (category) {
    case Category.education:
      return double.parse(((getCategoryPrice[category]! / totalPrice) * 100)
          .toStringAsFixed(2));
    case Category.food:
      return double.parse(((getCategoryPrice[category]! / totalPrice) * 100)
          .toStringAsFixed(2));
    case Category.technology:
      return double.parse(((getCategoryPrice[category]! / totalPrice) * 100)
          .toStringAsFixed(2));
    case Category.travel:
      return double.parse(((getCategoryPrice[category]! / totalPrice) * 100)
          .toStringAsFixed(2));
    default:
      throw Error();
  }
}
