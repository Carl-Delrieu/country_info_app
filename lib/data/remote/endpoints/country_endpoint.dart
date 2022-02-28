import 'dart:convert';
import 'dart:io';

import 'package:country_info_app/data/remote/api_service.dart';
import 'package:country_info_app/data/remote/api_strings.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';

class CountryEndpoint {
  APIService _service;

  CountryEndpoint(this._service);

  factory CountryEndpoint.defaultInstance() {
    return CountryEndpoint(APIService.defaultClient());
  }

  Future<CountryDTO> getCountry({required int id}) async {
    try {
      final json = await _service
          .get(endpoint: APIStrings.endpoint, query: {"id": id});
      return CountryDTO.fromJson(jsonDecode(json));
    } on HttpException{
      rethrow;
    }
  }
}
