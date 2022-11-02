// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Analyze extends DataClass implements Insertable<Analyze> {
  final int? id;
  final String imageDir;
  final String? result;
  final String species;
  final String description;
  final DateTime date;
  final String? note;
  final double? latitude;
  final double? longitude;
  final double percentage;
  const Analyze(
      {this.id,
      required this.imageDir,
      this.result,
      required this.species,
      required this.description,
      required this.date,
      this.note,
      this.latitude,
      this.longitude,
      required this.percentage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['image_dir'] = Variable<String>(imageDir);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    map['species'] = Variable<String>(species);
    map['description'] = Variable<String>(description);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['percentage'] = Variable<double>(percentage);
    return map;
  }

  AnalysisCompanion toCompanion(bool nullToAbsent) {
    return AnalysisCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      imageDir: Value(imageDir),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      species: Value(species),
      description: Value(description),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      percentage: Value(percentage),
    );
  }

  factory Analyze.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Analyze(
      id: serializer.fromJson<int?>(json['id']),
      imageDir: serializer.fromJson<String>(json['imageDir']),
      result: serializer.fromJson<String?>(json['result']),
      species: serializer.fromJson<String>(json['species']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      percentage: serializer.fromJson<double>(json['percentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'imageDir': serializer.toJson<String>(imageDir),
      'result': serializer.toJson<String?>(result),
      'species': serializer.toJson<String>(species),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'percentage': serializer.toJson<double>(percentage),
    };
  }

  Analyze copyWith(
          {Value<int?> id = const Value.absent(),
          String? imageDir,
          Value<String?> result = const Value.absent(),
          String? species,
          String? description,
          DateTime? date,
          Value<String?> note = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          Value<double?> longitude = const Value.absent(),
          double? percentage}) =>
      Analyze(
        id: id.present ? id.value : this.id,
        imageDir: imageDir ?? this.imageDir,
        result: result.present ? result.value : this.result,
        species: species ?? this.species,
        description: description ?? this.description,
        date: date ?? this.date,
        note: note.present ? note.value : this.note,
        latitude: latitude.present ? latitude.value : this.latitude,
        longitude: longitude.present ? longitude.value : this.longitude,
        percentage: percentage ?? this.percentage,
      );
  @override
  String toString() {
    return (StringBuffer('Analyze(')
          ..write('id: $id, ')
          ..write('imageDir: $imageDir, ')
          ..write('result: $result, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageDir, result, species, description,
      date, note, latitude, longitude, percentage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Analyze &&
          other.id == this.id &&
          other.imageDir == this.imageDir &&
          other.result == this.result &&
          other.species == this.species &&
          other.description == this.description &&
          other.date == this.date &&
          other.note == this.note &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.percentage == this.percentage);
}

class AnalysisCompanion extends UpdateCompanion<Analyze> {
  final Value<int?> id;
  final Value<String> imageDir;
  final Value<String?> result;
  final Value<String> species;
  final Value<String> description;
  final Value<DateTime> date;
  final Value<String?> note;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double> percentage;
  const AnalysisCompanion({
    this.id = const Value.absent(),
    this.imageDir = const Value.absent(),
    this.result = const Value.absent(),
    this.species = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.percentage = const Value.absent(),
  });
  AnalysisCompanion.insert({
    this.id = const Value.absent(),
    required String imageDir,
    this.result = const Value.absent(),
    required String species,
    required String description,
    required DateTime date,
    this.note = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    required double percentage,
  })  : imageDir = Value(imageDir),
        species = Value(species),
        description = Value(description),
        date = Value(date),
        percentage = Value(percentage);
  static Insertable<Analyze> custom({
    Expression<int>? id,
    Expression<String>? imageDir,
    Expression<String>? result,
    Expression<String>? species,
    Expression<String>? description,
    Expression<DateTime>? date,
    Expression<String>? note,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? percentage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageDir != null) 'image_dir': imageDir,
      if (result != null) 'result': result,
      if (species != null) 'species': species,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (percentage != null) 'percentage': percentage,
    });
  }

  AnalysisCompanion copyWith(
      {Value<int?>? id,
      Value<String>? imageDir,
      Value<String?>? result,
      Value<String>? species,
      Value<String>? description,
      Value<DateTime>? date,
      Value<String?>? note,
      Value<double?>? latitude,
      Value<double?>? longitude,
      Value<double>? percentage}) {
    return AnalysisCompanion(
      id: id ?? this.id,
      imageDir: imageDir ?? this.imageDir,
      result: result ?? this.result,
      species: species ?? this.species,
      description: description ?? this.description,
      date: date ?? this.date,
      note: note ?? this.note,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imageDir.present) {
      map['image_dir'] = Variable<String>(imageDir.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisCompanion(')
          ..write('id: $id, ')
          ..write('imageDir: $imageDir, ')
          ..write('result: $result, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }
}

class $AnalysisTable extends Analysis with TableInfo<$AnalysisTable, Analyze> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnalysisTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _imageDirMeta = const VerificationMeta('imageDir');
  @override
  late final GeneratedColumn<String> imageDir = GeneratedColumn<String>(
      'image_dir', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _speciesMeta = const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  final VerificationMeta _percentageMeta = const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<double> percentage = GeneratedColumn<double>(
      'percentage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        imageDir,
        result,
        species,
        description,
        date,
        note,
        latitude,
        longitude,
        percentage
      ];
  @override
  String get aliasedName => _alias ?? 'analysis';
  @override
  String get actualTableName => 'analysis';
  @override
  VerificationContext validateIntegrity(Insertable<Analyze> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_dir')) {
      context.handle(_imageDirMeta,
          imageDir.isAcceptableOrUnknown(data['image_dir']!, _imageDirMeta));
    } else if (isInserting) {
      context.missing(_imageDirMeta);
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    } else if (isInserting) {
      context.missing(_percentageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Analyze map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Analyze(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      imageDir: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}image_dir'])!,
      result: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      species: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      note: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      latitude: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      longitude: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      percentage: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}percentage'])!,
    );
  }

  @override
  $AnalysisTable createAlias(String alias) {
    return $AnalysisTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $AnalysisTable analysis = $AnalysisTable(this);
  late final AnalysisDAO analysisDAO = AnalysisDAO(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [analysis];
}
