import 'package:country_info_app/domain/features/add_favourite.dart';
import 'package:country_info_app/domain/features/delete_favourite.dart';
import 'package:country_info_app/domain/features/load_favourites.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_service_locator.dart';

void main() {
  late LoadFavouritesUseCase loadFavouritesUseCase;

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

  setUp(() {
    setupTestLocator();
    loadFavouritesUseCase = locator<LoadFavouritesUseCase>();

    final addFavouriteUseCase = locator<AddFavouriteUseCase>();
    addFavouriteUseCase.execute(country);
  });

  tearDown(() {
    final deleteFavouriteUseCase = locator<DeleteFavouriteUseCase>();
    deleteFavouriteUseCase.execute(country);
    tearDownTestLocator();
  });

  test('Load favourites from database', () async {
    final streamedFavourite = await loadFavouritesUseCase.execute().first;
    expect(streamedFavourite.first, country);
  });
}
