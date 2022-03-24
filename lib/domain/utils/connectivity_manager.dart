import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityManager {
  Future<bool> checkConnectivity();
}

class ConnectivityManagerImpl implements ConnectivityManager {
  final _connectivity = Connectivity();

  @override
  Future<bool> checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
