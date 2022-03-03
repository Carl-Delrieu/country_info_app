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

  CountryRepository(this._dao, this._endpoint) {
    _connectivity = Connectivity();
  }

  Future<List<Country>> _getAllFromDatabase() async {
    List<CountryEntity> countries = await _dao.getCountries();
    return countries.map((e) => CountryMapper.fromEntity(e)).toList();
  }

  Future<List<Country>> getAllCountries() async {
    List<Country> _countries = [];

    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (hasNoNetwork) {
      _countries = await _getAllFromDatabase();
    } else {
      try {
        final dtoList = await _endpoint.getCountries();
        _countries = dtoList.map((e) => CountryMapper.fromDTO(e)).toList();
      } catch (e) {
        _countries = await _getAllFromDatabase();
      }
    }
    return _countries;
  }

  Future<List<Country>> getAllFavourites() async => _getAllFromDatabase();

  Future<void> addCountry(Country country) async {
    await _dao.insertCountry(CountryMapper.toEntity(country));
  }

  Future<void> deleteCountry(int id) async {
    await _dao.deleteCountry(id);
  }
}
