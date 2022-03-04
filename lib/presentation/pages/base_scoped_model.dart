import 'package:country_info_app/presentation/pages/view_state.dart';
import 'package:scoped_model/scoped_model.dart';

class BaseScopedModel extends Model {
  ViewState _state = ViewState.loading;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}

