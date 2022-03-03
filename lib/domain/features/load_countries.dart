import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';

class LoadCountriesUseCase {
  final CountryRepository _repository;

  LoadCountriesUseCase(this._repository);

  Future<List<Country>> execute() async {
    try {
      return await _repository.getAllCountries();
    } catch (e) {
      rethrow;
    }
  }
}