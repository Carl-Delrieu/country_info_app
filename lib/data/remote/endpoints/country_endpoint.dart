import 'dart:convert';
import 'dart:io';

import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';
import 'package:country_info_app/data/remote/api_service.dart';

class CountryEndpoint {
  APIService _service;

  CountryEndpoint(this._service);

  factory CountryEndpoint.defaultInstance() {
    return CountryEndpoint(APIService.defaultClient());
  }

  Future<CountryDTO> getCountries() async {
    try {
      final json = await _service.get(unencodedPath: APIStrings.unencodedPath);
      return CountryDTO.fromJson(jsonDecode(json));
    } on HttpException catch(e) {
      rethrow;
    }
  }
}