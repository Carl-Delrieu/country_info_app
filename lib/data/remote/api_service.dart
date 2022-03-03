import 'dart:io';

import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIService {
  final http.Client _client;
  static const _timeoutSeconds = 10;

  APIService(this._client);

  factory APIService.defaultClient() => APIService(http.Client());

  static const String _baseUrl = APIStrings.baseURL;

  Future<String> get({
    required String endpoint,
  }) async {
    http.Response response = await _client
        .get(Uri.https(_baseUrl, endpoint))
        .timeout(const Duration(seconds: _timeoutSeconds));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw HttpException('${response.statusCode} http error');
    }
  }
}
