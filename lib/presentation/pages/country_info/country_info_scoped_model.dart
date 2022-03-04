import 'package:country_info_app/domain/features/add_favourite.dart';
import 'package:country_info_app/domain/features/delete_favourite.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/base_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_error.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';

class CountryInfoScopedModel extends BaseScopedModel {
  final AddFavouriteUseCase _addFavouriteUseCase;
  final DeleteFavouriteUseCase _deleteFavouriteUseCase;

  CountryInfoScopedModel(
      this._addFavouriteUseCase, this._deleteFavouriteUseCase);

  Country _countryToAdd = Country("name", "abbreviation", "capital", "currency",
      "phone", 0, "flag", "emblem", "orthographic", 0);

  Country get countryToAdd => _countryToAdd;

  int _countryToDelete = 0;

  int get countryToDelete => _countryToDelete;

  ViewError<ErrorType> _error = ViewError(ErrorType.none, '');

  ViewError<ErrorType> get error => _error;

  _setCountryToAdd(Country country) {
    _countryToAdd = country;
    notifyListeners();
  }

  _setCountryToDelete(Country country) {
    _countryToDelete = country.id;
    notifyListeners();
  }

  _setErrorState(ErrorType errorType, [String message = '']) {
    _error = ViewError(errorType, message);
    setState(ViewState.error);
    notifyListeners();
  }

  onAddToFavourite(Country? country) async {
    if (country == null) {
      _setErrorState(ErrorType.addingError, 'No country to add');
    } else {
      setState(ViewState.loading);
      _setCountryToAdd(country);
      try {
        await _addFavouriteUseCase.execute(_countryToAdd);
        setState(ViewState.ready);
      } catch (e) {
        _setErrorState(
            ErrorType.unexpected, 'Unexpected error: ${e.runtimeType}');
      }
    }
  }

  onDeleteFromFavourite(Country? country) async {
    if (country == null) {
      _setErrorState(ErrorType.deletingError, 'No country to delete');
    } else {
      setState(ViewState.loading);
      _setCountryToDelete(country);
      try {
        await _deleteFavouriteUseCase.execute(_countryToDelete);
        setState(ViewState.ready);
      } catch (e) {
        _setErrorState(
            ErrorType.unexpected, 'Unexpected error: ${e.runtimeType}');
      }
    }
  }

  onRetry() {}
}

enum ErrorType { none, addingError, deletingError, unexpected }
