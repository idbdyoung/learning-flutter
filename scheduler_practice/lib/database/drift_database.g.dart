// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $ScheduleTable extends Schedule
    with TableInfo<$ScheduleTable, ScheduleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _colorIdMeta =
      const VerificationMeta('colorId');
  @override
  late final GeneratedColumn<int> colorId = GeneratedColumn<int>(
      'color_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, date, startTime, endTime, colorId, createdAt];
  @override
  String get aliasedName => _alias ?? 'schedule';
  @override
  String get actualTableName => 'schedule';
  @override
  VerificationContext validateIntegrity(Insertable<ScheduleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('color_id')) {
      context.handle(_colorIdMeta,
          colorId.isAcceptableOrUnknown(data['color_id']!, _colorIdMeta));
    } else if (isInserting) {
      context.missing(_colorIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduleData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
      colorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ScheduleTable createAlias(String alias) {
    return $ScheduleTable(attachedDatabase, alias);
  }
}

class ScheduleData extends DataClass implements Insertable<ScheduleData> {
  final int id;
  final String content;
  final DateTime date;
  final int startTime;
  final int endTime;
  final int colorId;
  final DateTime createdAt;
  const ScheduleData(
      {required this.id,
      required this.content,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.colorId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    map['color_id'] = Variable<int>(colorId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScheduleCompanion toCompanion(bool nullToAbsent) {
    return ScheduleCompanion(
      id: Value(id),
      content: Value(content),
      date: Value(date),
      startTime: Value(startTime),
      endTime: Value(endTime),
      colorId: Value(colorId),
      createdAt: Value(createdAt),
    );
  }

  factory ScheduleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduleData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
      colorId: serializer.fromJson<int>(json['colorId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
      'colorId': serializer.toJson<int>(colorId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ScheduleData copyWith(
          {int? id,
          String? content,
          DateTime? date,
          int? startTime,
          int? endTime,
          int? colorId,
          DateTime? createdAt}) =>
      ScheduleData(
        id: id ?? this.id,
        content: content ?? this.content,
        date: date ?? this.date,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        colorId: colorId ?? this.colorId,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('ScheduleData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, content, date, startTime, endTime, colorId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleData &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.colorId == this.colorId &&
          other.createdAt == this.createdAt);
}

class ScheduleCompanion extends UpdateCompanion<ScheduleData> {
  final Value<int> id;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<int> startTime;
  final Value<int> endTime;
  final Value<int> colorId;
  final Value<DateTime> createdAt;
  const ScheduleCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.colorId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScheduleCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required DateTime date,
    required int startTime,
    required int endTime,
    required int colorId,
    this.createdAt = const Value.absent(),
  })  : content = Value(content),
        date = Value(date),
        startTime = Value(startTime),
        endTime = Value(endTime),
        colorId = Value(colorId);
  static Insertable<ScheduleData> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<int>? startTime,
    Expression<int>? endTime,
    Expression<int>? colorId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (colorId != null) 'color_id': colorId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScheduleCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<DateTime>? date,
      Value<int>? startTime,
      Value<int>? endTime,
      Value<int>? colorId,
      Value<DateTime>? createdAt}) {
    return ScheduleCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      colorId: colorId ?? this.colorId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    if (colorId.present) {
      map['color_id'] = Variable<int>(colorId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('colorId: $colorId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CategoryColorTable extends CategoryColor
    with TableInfo<$CategoryColorTable, CategoryColorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryColorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hexCodeMeta =
      const VerificationMeta('hexCode');
  @override
  late final GeneratedColumn<String> hexCode = GeneratedColumn<String>(
      'hex_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, hexCode];
  @override
  String get aliasedName => _alias ?? 'category_color';
  @override
  String get actualTableName => 'category_color';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryColorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hex_code')) {
      context.handle(_hexCodeMeta,
          hexCode.isAcceptableOrUnknown(data['hex_code']!, _hexCodeMeta));
    } else if (isInserting) {
      context.missing(_hexCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryColorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryColorData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hexCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hex_code'])!,
    );
  }

  @override
  $CategoryColorTable createAlias(String alias) {
    return $CategoryColorTable(attachedDatabase, alias);
  }
}

class CategoryColorData extends DataClass
    implements Insertable<CategoryColorData> {
  final int id;
  final String hexCode;
  const CategoryColorData({required this.id, required this.hexCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hex_code'] = Variable<String>(hexCode);
    return map;
  }

  CategoryColorCompanion toCompanion(bool nullToAbsent) {
    return CategoryColorCompanion(
      id: Value(id),
      hexCode: Value(hexCode),
    );
  }

  factory CategoryColorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryColorData(
      id: serializer.fromJson<int>(json['id']),
      hexCode: serializer.fromJson<String>(json['hexCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hexCode': serializer.toJson<String>(hexCode),
    };
  }

  CategoryColorData copyWith({int? id, String? hexCode}) => CategoryColorData(
        id: id ?? this.id,
        hexCode: hexCode ?? this.hexCode,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryColorData(')
          ..write('id: $id, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hexCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryColorData &&
          other.id == this.id &&
          other.hexCode == this.hexCode);
}

class CategoryColorCompanion extends UpdateCompanion<CategoryColorData> {
  final Value<int> id;
  final Value<String> hexCode;
  const CategoryColorCompanion({
    this.id = const Value.absent(),
    this.hexCode = const Value.absent(),
  });
  CategoryColorCompanion.insert({
    this.id = const Value.absent(),
    required String hexCode,
  }) : hexCode = Value(hexCode);
  static Insertable<CategoryColorData> custom({
    Expression<int>? id,
    Expression<String>? hexCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hexCode != null) 'hex_code': hexCode,
    });
  }

  CategoryColorCompanion copyWith({Value<int>? id, Value<String>? hexCode}) {
    return CategoryColorCompanion(
      id: id ?? this.id,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hexCode.present) {
      map['hex_code'] = Variable<String>(hexCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryColorCompanion(')
          ..write('id: $id, ')
          ..write('hexCode: $hexCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $ScheduleTable schedule = $ScheduleTable(this);
  late final $CategoryColorTable categoryColor = $CategoryColorTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedule, categoryColor];
}
