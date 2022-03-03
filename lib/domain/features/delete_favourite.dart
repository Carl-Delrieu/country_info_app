import 'package:country_info_app/domain/repositories/country_repository.dart';

class DeleteFavouriteUseCase {
  final CountryRepository _repository;

  DeleteFavouriteUseCase(this._repository);

  Future<void> execute(int id) async {
    await _repository.deleteCountry(id);
  }
}
