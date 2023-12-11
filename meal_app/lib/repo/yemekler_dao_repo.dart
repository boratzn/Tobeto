import 'package:dio/dio.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/details.dart';
import 'package:meal_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final yemeklerProvider =
    Provider<YemeklerDaoRepository>((ref) => YemeklerDaoRepository());

class YemeklerDaoRepository {
  String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<List<CategoryElement>> tumKategorileriAl() async {
    var url = "$baseUrl/categories.php";
    var cevap = await Dio().get(url);
    var categories = (cevap.data['categories'] as List)
        .map((e) => CategoryElement.fromJson(e))
        .toList();

    return categories;
  }

  Future<List<Meal>> kategoriyeGoreYemekleriAl(String category) async {
    var url = "$baseUrl/filter.php?c=$category";
    var cevap = await Dio().get(url);
    var meals =
        (cevap.data['meals'] as List).map((e) => Meal.fromJson(e)).toList();

    return meals;
  }

  Future<List<MealDetails>> yemekDetayi(String idMeal) async {
    var url = "$baseUrl/lookup.php?i=$idMeal";
    var cevap = await Dio().get(url);
    var mealDetails = (cevap.data['meals'] as List)
        .map((e) => MealDetails.fromJson(e))
        .toList();

    return mealDetails;
  }
}
