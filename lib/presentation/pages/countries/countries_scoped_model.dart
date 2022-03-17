import 'package:country_info_app/domain/features/load_countries.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/presentation/pages/base_scoped_model.dart';
import 'package:country_info_app/presentation/pages/view_error.dart';
import 'package:country_info_app/presentation/pages/view_state.dart';

class CountriesScopedModel extends BaseScopedModel {
  final LoadCountriesUseCase _loadCountriesUseCase;

  CountriesScopedModel(this._loadCountriesUseCase) {
    _loadCountries();
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

  onRetry() {
    _loadCountries();
  }

  _loadCountries() {
    setState(ViewState.loading);
    _loadCountriesUseCase.execute().listen((updatedList) {
      _setCountriesList(updatedList);
      (countriesList.isEmpty)
          ? setState(ViewState.empty)
          : setState(ViewState.ready);
    }).onError((e) => _setErrorState(
        ErrorType.unexpected, 'Unexpected error: ${e.runtimeType}'));
  }
}

enum ErrorType { none, unexpected }
