//notifier
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toogleMealFavorite(Meal m) {
    if (state.contains(m)) {
      final newState = state.where((element) => element.id != m.id).toList();
      state = newState;
    } else {
      final newState = [...state, m]; //... => spread operator
      state = newState;
    }
  }
}

//provider
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
