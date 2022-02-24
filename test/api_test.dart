import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:info_monde/data/remote/api_service/api_service.dart';
import 'package:info_monde/data/remote/api_service/api_strings.dart';

void main() {

  test("API connexion", () async {
    var client = http.Client();
    var response = await client.get(Uri.https(APIStrings.authority, APIStrings.unencodedPath));
    expect(response.statusCode, 200);
  });

  test('Response data', () async {
    var data = APIService().getData();
    expect(data, isNotNull);
  });
}