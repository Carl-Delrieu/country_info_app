import 'package:country_info_app/domain/utils/connectivity_manager.dart';

class ConnectivityManagerFake implements ConnectivityManager {
  bool _hasNetwork = true;

  @override
  Future<bool> checkConnectivity() {
    return Future.value(_hasNetwork);
  }

  setConnectivity({required bool hasNetwork}) {
    _hasNetwork = hasNetwork;
  }
}