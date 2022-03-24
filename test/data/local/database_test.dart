import 'package:country_info_app/data/local/db_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DBService database;
  final country = CountryEntity(
      name: "Test-Land",
      abbreviation: "TST",
      capital: "Test-City",
      currency: "TTC",
      phone: "2051920",
      population: 2,
      flag:
          "https://www.pinclipart.com/picdir/middle/194-1949582_science-test-svg-icon-science-clipart.png",
      emblem: "",
      orthographic: "",
      id: 30094000);

  setUp(() {
    database = DBService.test();
  });

  tearDown(() async {
    await database.close();
  });

  test('Country can be insert and retrieve', () async {
    final insertedCountryID = await database.countryDAO.insertCountry(country);
    final retrievedCountry = await database.countryDAO.getCountry(country.id);

    expect(retrievedCountry, country.copyWith(id: insertedCountryID));
  });

  test('Country can be deleted', () async {
    await database.countryDAO.insertCountry(country);
    final deletedCountry = await database.countryDAO.deleteCountry(country.id);

    expect(deletedCountry, 1);
    expect(() => database.countryDAO.getCountry(country.id),
        throwsA(const TypeMatcher<StateError>()));
  });
}
