import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class LoadFavouritesUseCase {
  final CountryRepository _repository;

  LoadFavouritesUseCase(this._repository);

  Future<List<Country>> execute() async {
    try {
      return await _repository.getAllFavourites();
    } catch (e) {
      rethrow;
    }

  }
}