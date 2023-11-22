import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.purple[100],
  appBarTheme: AppBarTheme(backgroundColor: Colors.purple),
  cardTheme: CardTheme(
    color: Colors.purple[200],
    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    background: Colors.purple,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.purple[200],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(Colors.purple),
    ),
  ),
);
