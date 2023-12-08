import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

final mealsProvider = Provider((ref) {
  return const [
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
});
