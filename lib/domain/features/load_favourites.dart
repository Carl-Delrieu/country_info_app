import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class LoadFavouritesUseCase {
  final _repository;

  LoadFavouritesUseCase(CountryRepository this._repository);

  Future<Country> loadFavourite({required int id}) async {
    Country? country;
    try {
      country = await _repository.getCountry(id: id);
    } catch(e) {
      rethrow;
    }
    final favourite = country;

    if (favourite != null) {
      return Future<Country>.value(favourite);
    } else {
      throw CountryRetrievalException();
    }
  }
}

class CountryRetrievalException implements Exception {}