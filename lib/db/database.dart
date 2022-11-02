import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:plant_diagnosis/db/daos/analysis_dao.dart';
import 'package:plant_diagnosis/db/tables/analysis_table.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(
      file,
      logStatements: true,
    );
  });
}

@DriftDatabase(tables: [Analysis], daos: [AnalysisDAO])
class MyDatabase extends _$MyDatabase {
  static MyDatabase instance = MyDatabase._internal();

  MyDatabase._internal() : super(_openConnection()) {
    analysisDAO = AnalysisDAO(this);
  }

  late AnalysisDAO analysisDAO;
  // ProductDAO productDAO;

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      beforeOpen: (details) async {
        print('version now: ${details.versionNow}');
      },
      onUpgrade: (Migrator m, int from, int to) async {
        print('old version: $from');
        print('to version: $to');
      },
    );
  }
}
