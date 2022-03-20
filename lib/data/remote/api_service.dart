import 'dart:convert';
import 'dart:io';

import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
class APIService {
  final http.Client _client;

  APIService(this._client);

  factory APIService.defaultClient() => APIService(http.Client());

  static const _timeoutSeconds = 15;
  static const String _baseUrl = APIStrings.baseURL;


  Future<Map<String, dynamic>> get({
    required String endpoint,
    int successCode = 200,
  }) async {
    http.Response response = await _client
        .get(Uri.https(_baseUrl, endpoint))
        .timeout(const Duration(seconds: _timeoutSeconds));
    return _handleResponse(response, successCode);
  }

  dynamic _handleResponse(http.Response response, int successCode) {
    debugPrint("Expected: $successCode\nActual: ${response.statusCode}\n");
    if (response.statusCode == successCode) {
      return jsonDecode('{"list":' + response.body + '}');
    } else {
      throw HttpException('${response.statusCode} http error');
    }
  }
}
