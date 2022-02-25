import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:drift/drift.dart';

part 'country_dao.g.dart';

@DriftAccessor(tables: [CountriesEntity])
class CountryDAO extends DatabaseAccessor<DBService> with _$CountryDAOMixin {
  CountryDAO(DBService _database) : super(_database);

  Future<List<CountryEntity>> getCountries() async {
    return await select(countriesEntity).get();
  }

  Stream<List<CountryEntity>> watchCountries() {
    return select(countriesEntity).watch();
  }

  Future<CountryEntity> getCountry(int id) async {
    return await (select(countriesEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateCountry(CountriesEntityCompanion country) async {
    return await update(countriesEntity).replace(country);
  }

  Future<int> insertCountry(CountriesEntityCompanion country) async {
    return await into(countriesEntity).insert(country);
  }

  Future<int> deleteCountry(int id) async {
    return await (delete(countriesEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

}
