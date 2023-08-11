import 'package:drift/drift.dart';

const DEFAULT_COLORS = [
  'F44336',
  'FF9800',
  'FFEB3B',
  'FCAF50',
  '2196F3',
  '9C27B0',
];

class CategoryColor extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get hexCode => text()();
}