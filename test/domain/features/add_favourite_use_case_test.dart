import 'package:country_info_app/domain/features/add_favourite.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_service_locator.dart';

void main() {
  late AddFavouriteUseCase addFavouriteUseCase;

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

  List<Country> countries = [];
  countries.add(country);

  setUp(() {
    setupTestLocator();
    addFavouriteUseCase = locator<AddFavouriteUseCase>();
  });
  
  tearDown(() {
    tearDownTestLocator();
  });
  
  test('Add country to favourite', () {
    final future = addFavouriteUseCase.execute(country);
    expect(future, completes);
  });
}