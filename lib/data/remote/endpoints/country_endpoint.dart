import 'dart:async';
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

  Future<List<CountryDTO>?> getCountries() async {
    try {
      List<CountryDTO> _countries = [];
      final json = await _service.get(endpoint: APIStrings.endpoint);
      for (var country in json['list']) {
        _countries.add(CountryDTO.fromJson(country));
      }
      return _countries;
    } on HttpException {
      rethrow;
    }
  }
}
