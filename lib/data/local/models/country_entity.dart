import 'dart:core';

import 'package:country_info_app/data/local/db_service.dart';
import 'package:drift/drift.dart';

@UseRowClass(CountryEntity)
class CountriesEntity extends Table {
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

class CountryEntity implements Insertable<CountryEntity>{
  final int id;
  final String name;
  final String abbreviation;
  final String capital;
  final String currency;
  final String phone;
  final int? population;
  final String flag;
  final String emblem;
  final String orthographic;

  CountryEntity({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.capital,
    required this.currency,
    required this.phone,
    required this.population,
    required this.flag,
    required this.emblem,
    required this.orthographic,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return CountriesEntityCompanion(
      id: Value(id),
      name: Value(name),
      abbreviation: Value(abbreviation),
      capital: Value(capital),
      currency: Value(currency),
      phone: Value(phone),
      population: Value(population),
      flag: Value(flag),
      emblem: Value(emblem),
      orthographic: Value(orthographic)
    ).toColumns(nullToAbsent);
  }
}
