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

  late Country country;

  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;

  ViewError<ErrorType> _error = ViewError(ErrorType.none, '');
  ViewError<ErrorType> get error => _error;

  _setIsFavourite(bool favourite) {
    _isFavourite = favourite;
    notifyListeners();
  }

  _setErrorState(ErrorType errorType, [String message = '']) {
    _error = ViewError(errorType, message);
    setState(ViewState.error);
    notifyListeners();
  }

  onFavouriteButtonClick() async {
    setState(ViewState.loading);
    try {
      if (!isFavourite) {
        _addFavouriteUseCase.execute(country);
      } else {
        _deleteFavouriteUseCase.execute(country);
      }
      _setIsFavourite(!isFavourite);
      setState(ViewState.ready);
    } catch (e) {
      _setErrorState(ErrorType.unexpected, 'Unexpected error: ${e.runtimeType}');
    }
  }
}

enum ErrorType { none, addingError, deletingError, unexpected }
