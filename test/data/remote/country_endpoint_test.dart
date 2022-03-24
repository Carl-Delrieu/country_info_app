import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final endpoint = CountryEndpoint.fake();
  final countryDTO = CountryDTO(
      name: "Test-Land",
      abbreviation: "TST",
      capital: "Test-City",
      currency: "TTC",
      phone: "2051920",
      population: 2,
      flag: "https://www.pinclipart.com/picdir/middle/194-1949582_science-test-svg-icon-science-clipart.png",
      emblem: "",
      orthographic: "",
      id: 30094000);
  
  test('Retrieve the correct country', () async {
    final country = await endpoint.getCountries();
    expect(country?.first, countryDTO);
  });
}
