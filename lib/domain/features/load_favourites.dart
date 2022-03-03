import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class LoadFavouritesUseCase {
  final CountryRepository _repository;

  LoadFavouritesUseCase(this._repository);

  Future<List<Country>> call() async {
    List<Country>? countries;
    try {
      countries = await _repository.getAll();
    } catch(e) {
      rethrow;
    }

    if (countries != null) {
      return countries;
    } else {
      throw CountriesRetrievalException();
    }
  }
}

class CountriesRetrievalException implements Exception {}