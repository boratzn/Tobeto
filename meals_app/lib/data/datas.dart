import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

const categories = [
  Category(id: "1", name: "Başlangıçlar", color: Colors.purple),
  Category(id: "2", name: "Ara Sıcaklar", color: Colors.pink),
  Category(id: "3", name: "Ana Yemekler", color: Colors.red),
  Category(id: "4", name: "Tatlılar"),
];

const meals = [
  Meal(
      id: "1",
      categoryId: "1",
      name: "Mercimek Çorbası",
      imageUrl: "imageUrl",
      ingreients: ["Malzeme 1", "Malzeme 2", "Malzeme 3", "Malzeme 4"]),
  Meal(
      id: "2",
      categoryId: "4",
      name: "Sütlaç",
      imageUrl: "imageUrl",
      ingreients: ["Malzeme 1", "Malzeme 2", "Malzeme 3", "Malzeme 4"]),
];
