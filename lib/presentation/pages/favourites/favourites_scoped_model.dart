import 'package:country_info_app/domain/features/load_favourites.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/base_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_error.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';

class FavouritesScopedModel extends BaseScopedModel {

  final LoadFavouritesUseCase _loadFavouritesUseCase;

  FavouritesScopedModel(this._loadFavouritesUseCase) {
    setState(ViewState.loading);
    _loadFavouritesUseCase.execute().listen((updatedList) {
      _setCountriesList(updatedList);
      (countriesList.isEmpty)
          ? setState(ViewState.empty)
          : setState(ViewState.ready);
    }).onError((e) =>
        _setErrorState(
            ErrorType.unexpected, 'Unexpected error: ${e.runtimeType}'));
  }

  List<Country> _countriesList = [];

  List<Country> get countriesList => _countriesList;

  ViewError<ErrorType> _error = ViewError(ErrorType.none, '');

  ViewError<ErrorType> get error => _error;

  _setCountriesList(List<Country> list) {
    _countriesList = list;
    notifyListeners();
  }

  _setErrorState(ErrorType errorType, [String message = '']) {
    _error = ViewError(errorType, message);
    setState(ViewState.error);
    notifyListeners();
  }
}

enum ErrorType { none, unexpected }
