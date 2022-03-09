import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class DeleteFavouriteUseCase {
  final CountryRepository _repository;

  DeleteFavouriteUseCase(this._repository);

  Future<void> execute(Country country) async {
    await _repository.deleteCountry(country);
  }
}
