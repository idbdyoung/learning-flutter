import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scheduler_practice/database/drift_database.dart';
import 'package:scheduler_practice/models/category_color.dart';
import 'package:scheduler_practice/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final color = await database.getCategoryColors();

  if (color.isEmpty) {
    for (String hexCode in DEFAULT_COLORS) {
      await GetIt.I<LocalDatabase>().createCategoryColor(
        CategoryColorCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
