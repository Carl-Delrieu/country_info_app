import 'dart:io';

import 'package:country_info_app/data/local/db_strings.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'db_service.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, DBStrings.dbName));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [CountryEntity])
class DBService extends _$DBService {
  DBService() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
