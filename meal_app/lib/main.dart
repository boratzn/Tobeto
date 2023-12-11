import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/data_provider.dart';
import 'package:meal_app/widgets/drawer_menu.dart';

import 'widgets/category_card.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(categoriesProvider);

    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey.shade400,
            ),
            cardColor: Colors.blueGrey.shade100),
        debugShowCheckedModeBanner: false,
        home: _data.when(
          data: (data) {
            return Scaffold(
              backgroundColor: Colors.blueGrey.shade400,
              drawer: DrawerMenu(categories: data),
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: const Text(
                  "Categories",
                ),
              ),
              body: Center(
                child: GridView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var category = data[index];
                    return CategoryCard(category: category);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
