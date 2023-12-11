import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/repo/yemekler_dao_repo.dart';

final categoriesProvider = FutureProvider((ref) {
  return ref.watch(yemeklerProvider).tumKategorileriAl();
});
