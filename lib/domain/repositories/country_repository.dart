import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/local/models/country_entity.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/models/country_mapper.dart';
import 'package:flutter/material.dart';

class CountryRepository {
  final CountryDAO _dao;
  final CountryEndpoint _endpoint;
  late Connectivity _connectivity;

  List<Country>? _countries;
  Country? _country;


  CountryRepository(this._dao, this._endpoint) {
    _connectivity = Connectivity();
  }

  Future<List<Country>?> _getAllFromDatabase() async {
    final countries = await _dao.getCountries();
    return CountryMapper.fromEntityList(countries);
  }

  Future<List<Country>?> getAll() async {
    ConnectivityResult connectivityResult =
    await _connectivity.checkConnectivity();

    final isNotMemorized = _countries!.isEmpty;
    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (isNotMemorized) {
      if (hasNoNetwork) {
        _countries = await _getAllFromDatabase();
      } else {
        try {
          final dto = await _endpoint.getCountries();
          _countries = CountryMapper.fromDTOList(dto);
          if (_countries!.isNotEmpty) {
            for (var country in _countries!) {
              _dao.insertCountry(
                  CountryMapper.toEntity(country).toColumns(true)
                  as CountriesEntityCompanion);
            }
          }
        } catch (e) {
          _countries = await _getAllFromDatabase();
        }
      }
    }
    return Future<List<Country>?>.value(_countries);
  }

  Future<Country?> _getOneFromDatabase({required int id}) async {
    final countryEntity = await _dao.getCountry(id);
    return CountryMapper.fromEntity(countryEntity);
  }

  Future<Country?> getOne({required int id}) async {
    ConnectivityResult connectivityResult =
    await _connectivity.checkConnectivity();

    final isNotMemorized = _country == null;
    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (isNotMemorized) {
      if (hasNoNetwork) {
        _country = await _getOneFromDatabase(id: id);
      } else {
        try {
          final dto = await _endpoint.getCountry(id: id);
          _country = CountryMapper.fromDTO(dto);
          if (_country != null) {
            _dao.insertCountry(
                CountryMapper.toEntity(_country!).toColumns(true)
                as CountriesEntityCompanion);
          }
        } catch (e) {
          _country = await _getOneFromDatabase(id: id);
        }
      }
    }
    return Future<Country?>.value(_country);
  }

  Future<int> _removeFromDatabase({required int id}) {
    return _dao.deleteCountry(id);
  }

  Future<void> remove({required int id}) async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    Country temp = _dao.getCountry(id) as Country;

    final isMemorized = _countries?.contains(temp);
    final hasNoNetwork = connectivityResult == ConnectionState.none;

    if (isMemorized!) {
      if (hasNoNetwork) {
        _removeFromDatabase(id: id);
      } else {
        try {
          final dto = await _endpoint.getCountries();
          _countries = CountryMapper.fromDTOList(dto);
          if (_countries!.isNotEmpty) {
            for (var country in _countries!) {
              _dao.deleteCountry(id);
            }
          }
        } catch (e) {
          _removeFromDatabase(id: id);
        }
      }
    }
  }
}
