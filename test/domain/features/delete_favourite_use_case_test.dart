import 'package:country_info_app/domain/features/delete_favourite.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_service_locator.dart';

void main() {
  late DeleteFavouriteUseCase deleteFavouriteUseCase;

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
    deleteFavouriteUseCase = locator<DeleteFavouriteUseCase>();
  });

  tearDown(() {
    tearDownTestLocator();
  });

  test('Delete country from favourite', () {
    final future = deleteFavouriteUseCase.execute(country);
    expect(future, completes);
  });
}
