import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class LoadFavouritesUseCase {
  final CountryRepository _repository;

  LoadFavouritesUseCase(this._repository);

  Future<Country> call({required int id}) async {
    Country? country;
    try {
      country = await _repository.getOne(id: id);
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