import 'package:http/http.dart' as http;

class APIService {
  final http.Client _client;
  static const _timeoutSeconds = 10;

  APIService(this._client);

  factory APIService.defaultClient()

}