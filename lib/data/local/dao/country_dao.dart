import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:drift/drift.dart';

part 'country_dao.g.dart';

@DriftAccessor(tables: [CountryTable])
class CountryDAO extends DatabaseAccessor<DBService> with _$CountryDAOMixin {
  CountryDAO(DBService _database) : super(_database);

  Future<List<CountryEntity>> getCountries() async {
    return await select(countryTable).get();
  }

  Stream<List<CountryEntity>> watchCountries() {
    return select(countryTable).watch();
  }

  Future<CountryEntity> getCountry(int id) async {
    return await (select(countryTable)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateCountry(Insertable<CountryEntity> country) async {
    return await update(countryTable).replace(country);
  }

  Future<int> insertCountry(Insertable<CountryEntity> country) async {
    return await into(countryTable).insert(country, onConflict: DoUpdate((tbl) => country));
  }

  Future<int> deleteCountry(int id) async {
    return await (delete(countryTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
