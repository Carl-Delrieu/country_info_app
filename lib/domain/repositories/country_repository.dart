import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:flutter/material.dart';

class CountryRepository {
  CountryDAO _dao;
  CountryEndpoint _endpoint;
  late Connectivity _connectivity;
  List<Country?> _countries;

  CountryRepository(this._dao, this._endpoint) {
    _connectivity = Connectivity();
  }

  Future<List<Country?>> getCountries() async {
    ConnectivityResult connectivityResult = await _connectivity.checkConnectivity();

    final isNotMemorized = _countries == null;
    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (isNotMemorized) {
      if (hasNoNetwork) {
        _countries = await _getCountriesFromDatabase();
      }
    }

    return Future<List<Country?>>.value(_countries);
  }

  Future<Country?> _getCountriesFromDatabase() async {
    final countriesList = await _dao.getCountries();
    if (countriesList != null)
  }
}