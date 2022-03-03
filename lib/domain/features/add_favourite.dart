import 'package:country_info_app/domain/repositories/country_repository.dart';

class AddFavouriteUseCase {
  final CountryRepository _repository;

  AddFavouriteUseCase(this._repository);

  Future<void> call({required int id}) {
    return _repository.getOne(id: id);
  }
}