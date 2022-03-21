import 'dart:io';

import 'package:country_info_app/data/local/db_strings.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_inspector/drift_inspector.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'db_service.g.dart';

LazyDatabase _openConnection(String dbName) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, dbName));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [CountryTable])
class DBService extends _$DBService {
  DBService(QueryExecutor e) : super(e);

  factory DBService.defaultInstance() => DBService(_openConnection(DBStrings.dbName));

  factory DBService.test() => DBService(_openConnection(DBStrings.tDbName));

  factory DBService.inspectorInstance()  {
    final database = DBService(_openConnection(DBStrings.dbName));
    // ignore: deprecated_member_use
    final driftInspector = DriftInspectorBuilder()
      ..bundleId = 'com.example.country_info_app'
      ..icon = 'flutter'
      ..addDatabase(DBStrings.dbName, database);
    final inspector = driftInspector.build();
    inspector.start();
    return database;
  }

  @override
  int get schemaVersion => 1;
}