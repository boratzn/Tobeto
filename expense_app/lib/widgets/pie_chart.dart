import 'package:expense_app/data/expense_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/expense.dart';
import 'indicator.dart';

class PieChartSample extends StatefulWidget {
  const PieChartSample({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
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
                color: AppColors.contentColorBlue,
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
            color: AppColors.contentColorBlue,
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
            value: 30,
            title: '${selectCategory(Category.food)}%',
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
            value: 15,
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
            value: 15,
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
  double educationPrice = 0,
      foodPrice = 0,
      technologyPrice = 0,
      travelPrice = 0,
      totalPrice = 0;

  for (var item in expenseList) {
    totalPrice += item.price;
  }

  switch (category) {
    case Category.education:
      educationPrice = calculateTotalPriceForItems(category, educationPrice);
      return double.parse(
          ((educationPrice / totalPrice) * 100).toStringAsFixed(2));
    case Category.food:
      foodPrice = calculateTotalPriceForItems(category, foodPrice);
      return double.parse(((foodPrice / totalPrice) * 100).toStringAsFixed(2));
    case Category.technology:
      technologyPrice = calculateTotalPriceForItems(category, technologyPrice);
      return double.parse(
          ((technologyPrice / totalPrice) * 100).toStringAsFixed(2));
    case Category.travel:
      travelPrice = calculateTotalPriceForItems(category, travelPrice);
      return double.parse(
          ((travelPrice / totalPrice) * 100).toStringAsFixed(2));
    default:
      throw Error();
  }
}

double calculateTotalPriceForItems(Category category, double price) {
  for (var item in expenseList) {
    if (item.category == category) {
      price += item.price.toDouble();
    }
  }
  return price;
}