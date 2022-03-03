import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class AddFavouriteUseCase {
  final CountryRepository _repository;

  AddFavouriteUseCase(this._repository);

  Future<void> execute(Country country) async {
    await _repository.addCountry(country);
  }
}
