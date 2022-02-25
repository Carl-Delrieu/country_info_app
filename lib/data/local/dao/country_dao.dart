import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:drift/drift.dart';

part 'country_dao.g.dart';

@DriftAccessor(tables: [CountryEntity])
class CountryDAO extends DatabaseAccessor<DBService> with _$CountryDAOMixin {
  CountryDAO(DBService _database) : super(_database);

  Future<List<CountryEntityData>> getCountries() async {
    return await select(countryEntity).get();
  }

  Stream<List<CountryEntityData>> watchCountries() {
    return select(countryEntity).watch();
  }

  Future<CountryEntityData> getCountry(int id) async {
    return await (select(countryEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<bool> updateCountry(CountryEntityCompanion country) async {
    return await update(countryEntity).replace(country);
  }

  Future<int> insertCountry(CountryEntityCompanion country) async {
    return await into(countryEntity).insert(country);
  }

  Future<int> deleteCountry(int id) async {
    return await (delete(countryEntity)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
