import 'dart:convert';
import 'dart:io';

import 'package:country_info_app/data/remote/api_strings.dart';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([http.Client])
class APIService {
  final http.Client _client;

  APIService(this._client);

  factory APIService.defaultClient() => APIService(http.Client());

  static const _timeoutSeconds = 15;
  static const String _baseUrl = APIStrings.baseURL;
  static const Map<String, String> _baseHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, String>? query,
    Map<String, String>? additionalHeaders,
    int successCode = 200,
  }) async {
    final headers = _addHeaders(additionalHeaders);
    final response = await _client
        .get(Uri.https(_baseUrl, endpoint, query), headers: headers)
        .timeout(const Duration(seconds: _timeoutSeconds));
    return _handleResponse(response, successCode);
  }

  Map<String, String> _addHeaders(Map<String, String>? additionalHeaders) {
    final headers = Map<String, String>.from(_baseHeaders);
    if (additionalHeaders != null) {
      for (MapEntry entry in additionalHeaders.entries) {
        headers.putIfAbsent(entry.key, () => entry.value);
      }
    }
    return headers;
  }

  Map<String, dynamic> _handleResponse(
      http.Response response, int successCode) {
    //debugPrint("Expected: $successCode\nActual: ${response.statusCode}\n");
    if (response.statusCode == successCode) {
      return jsonDecode('{"data":' + response.body + '}');
    } else {
      throw HttpException('${response.statusCode} http error');
    }
  }
}
