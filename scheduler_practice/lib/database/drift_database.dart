import 'dart:io';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:scheduler_practice/models/category_color.dart';
import 'package:scheduler_practice/models/schedule.dart';
import 'package:scheduler_practice/models/schedule_with_color.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedule,
    CategoryColor,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<List<CategoryColorData>> getCategoryColors() =>
      select(categoryColor).get();

  Future<int> createCategoryColor(CategoryColorCompanion data) =>
      into(categoryColor).insert(data);

  Future<ScheduleData> getScheduleById(int id) =>
      (select(schedule)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<int> createSchedule(ScheduleCompanion data) =>
      into(schedule).insert(data);

  Future<int> updateScheduleById(int id, ScheduleCompanion data) =>
      (update(schedule)..where((tbl) => tbl.id.equals(id))).write(data);

  Stream<List<ScheduleWithColor>> watchScheduleWithColors(
      DateTime selectedDate) {
    final query = select(schedule).join([
      innerJoin(categoryColor, schedule.colorId.equalsExp(categoryColor.id)),
    ]);
    query.where(schedule.date.equals(selectedDate));
    query.orderBy([OrderingTerm.asc(schedule.startTime)]);

    return query.watch().map(
          (rows) => rows
              .map(
                (row) => ScheduleWithColor(
                  schedule: row.readTable(schedule),
                  categoryColor: row.readTable(categoryColor),
                ),
              )
              .toList(),
        );
  }

  Future<int> removeSchedule(int id) =>
      (delete(schedule)..where((tbl) => tbl.id.equals(id))).go();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
