import 'package:country_info_app/data/local/db_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_service_locator.dart';

void main() {
  final country = CountryEntity(
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

  setUp(() async {
    setupTestLocator();
  });

  tearDown(() {
    tearDownTestLocator();
  });

  test('Country can be created', () async {

  });
}
