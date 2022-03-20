import 'package:country_info_app/data/remote/api_service.dart';
import 'package:country_info_app/data/remote/api_service.mocks.dart';
import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

class FakeAPIService extends APIService {
  FakeAPIService(http.Client client) : super(client);

  static const _baseURL = APIStrings.baseURL;
  static const _endpoint = APIStrings.endpoint;
  static const _successfulResponse = '''{
    "abbreviation": "TS",
    "capital": "Test-City",
    "currency": "TTC",
    "name": "Test-Land",
    "phone": "2051920",
    "population": 2,
    "media": {
      "flag": "https://www.pinclipart.com/picdir/middle/194-1949582_science-test-svg-icon-science-clipart.png",
      "emblem": "",
      "orthographic": ""
    },
    "id": 30094000
  }''';
  static const _failingResponse = '''{
    "message": "The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again."
  }''';

  factory FakeAPIService.getInstance() {
    final client = MockClient();

    when(client.get(Uri.https(_baseURL, _endpoint)))
        .thenAnswer((_) async => http.Response(_successfulResponse, 200));

    when(client.get(argThat(isNot(Uri.https(_baseURL, _endpoint)))))
        .thenAnswer((_) async => http.Response(_failingResponse, 404));

    return FakeAPIService(client);
  }
}
