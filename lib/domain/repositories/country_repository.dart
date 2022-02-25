import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/models/country_mapper.dart';
import 'package:flutter/material.dart';

class CountryRepository {
  final CountryDAO _dao;
  final CountryEndpoint _endpoint;
  late Connectivity _connectivity;
  Country? _country;

  CountryRepository(this._dao, this._endpoint) {
    _connectivity = Connectivity();
  }

  Future<Country?> getCountry({required int id}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    final isNotMemorized = _country == null;
    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (isNotMemorized) {
      if (hasNoNetwork) {
        _country = await _getCountryFromDatabase(id: id);
      } else {
        try {
          final dto = await _endpoint.getCountry(id: id);
          _country = CountryMapper.fromDTO(dto);
          if (_country != null) {
            _dao.insertCountry(CountryMapper.toEntity(_country!).toColumns(true)
                as CountriesEntityCompanion);
          }
        } catch (e) {
          _country = await _getCountryFromDatabase(id: id);
        }
      }
    }

    return Future<Country?>.value(_country);
  }

  Future<Country?> _getCountryFromDatabase({required int id}) async {
    final countryEntity = await _dao.getCountry(id);
    return CountryMapper.fromEntity(countryEntity);
  }
}
