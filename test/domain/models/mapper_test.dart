import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/models/country_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final countryDTO = CountryDTO(
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

  final countryEntity = CountryEntity(
      id: 30094000,
      name: "Test-Land",
      abbreviation: "TST",
      capital: "Test-City",
      currency: "TTC",
      phone: "2051920",
      population: 2,
      flag:
          "https://www.pinclipart.com/picdir/middle/194-1949582_science-test-svg-icon-science-clipart.png",
      emblem: "",
      orthographic: "");

  final country = Country(
      "Test-Land",
      "TST",
      "Test-City",
      "TTC",
      "2051920",
      2,
      "https://www.pinclipart.com/picdir/middle/194-1949582_science-test-svg-icon-science-clipart.png",
      "",
      "",
      30094000,
      false);

  test('CountryDTO -> Country', () {
    final mappedCountry = CountryMapper.fromDTO(countryDTO);
    expect(mappedCountry, country);
  });

  test('Country -> CountryDTO', () {
    final mappedCountryDTO = CountryMapper.toDTO(country);
    expect(mappedCountryDTO, countryDTO);
  });

  test('CountryEntity -> Country', () {
    final mappedCountry = CountryMapper.fromEntity(countryEntity);
    expect(mappedCountry, country);
  });

  test('Country -> CountryEntity', () {
    final mappedCountryEntity = CountryMapper.toEntity(country);
    expect(mappedCountryEntity, countryEntity);
  });
}
