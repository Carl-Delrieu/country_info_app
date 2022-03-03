import 'dart:core';

import 'package:drift/drift.dart';

@DataClassName('CountryEntity')
class CountryTable extends Table {
  @override
  String get tableName => 'favourite_countries';

  IntColumn get id => integer().named('id')();

  TextColumn get name => text().named('name')();

  TextColumn get abbreviation => text().named('abbreviation')();

  TextColumn get capital => text().named('capital')();

  TextColumn get currency => text().named('currency')();

  TextColumn get phone => text().named('phone')();

  IntColumn get population => integer().named('population').nullable()();

  TextColumn get flag => text().named('flag')();

  TextColumn get emblem => text().named('emblem')();

  TextColumn get orthographic => text().named('orthographic')();
}
