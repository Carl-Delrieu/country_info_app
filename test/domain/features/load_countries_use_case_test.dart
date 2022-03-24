import 'package:country_info_app/domain/features/load_countries.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_service_locator.dart';

void main() {
  late LoadCountriesUseCase loadCountriesUseCase;
  Country country = Country(
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

  setUp(() async {
    setupTestLocator();
    loadCountriesUseCase = locator<LoadCountriesUseCase>();
  });

  tearDown(() {
    tearDownTestLocator();
  });

  test('Load countries from API', () async {
    final stream = loadCountriesUseCase.execute();
    final streamedCountry = await stream.first;
    expect(streamedCountry.first, country);
  });
}
