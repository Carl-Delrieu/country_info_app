import 'package:country_info_app/domain/repositories/country_repository.dart';

class RemoveFavouriteUseCase {
  final CountryRepository _repository;

  RemoveFavouriteUseCase(this._repository);

  Future<void> call({required int id}) {
    return _repository.remove(id: id);
  }
}