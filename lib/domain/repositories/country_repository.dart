import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/data/remote/models/country_dto.dart';
import 'package:country_info_app/domain/models/country.dart';
import 'package:country_info_app/domain/models/country_mapper.dart';
import 'package:country_info_app/domain/utils/connectivity_manager.dart';

class CountryRepository {
  final CountryDAO _dao;
  final CountryEndpoint _endpoint;
  final ConnectivityManager _connectivityManager;

  List<Country> _countries = [];

  CountryRepository(this._dao, this._endpoint, this._connectivityManager);

  Stream<List<Country>> getAllCountries() {
    return _getAllFromDatabase()
        .asyncMap((List<Country> favouriteCountries) async {
      final isNotMemoized = _countries.isEmpty;
      final hasNetwork = await _connectivityManager.checkConnectivity();

      if (isNotMemoized) {
        if (!hasNetwork) {
          return favouriteCountries;
        } else {
          try {
            final apiList = await _endpoint.getCountries();
            _countries = apiList
                    ?.map((CountryDTO e) => CountryMapper.fromDTO(e))
                    .toList() ??
                [];
            return _combineFavListIntoApiList(
                favList: favouriteCountries, apiList: _countries);
          } catch (e) {
            return favouriteCountries;
          }
        }
      }

      return _combineFavListIntoApiList(
          favList: favouriteCountries, apiList: _countries);
    });
  }

  List<Country> _combineFavListIntoApiList(
          {required List<Country> favList, required List<Country> apiList}) =>
      apiList
          .map((country) => country.copyWith(
              isFavourite: favList.any((fav) => fav.name == country.name)))
          .toList();

  Stream<List<Country>> getAllFavourites() => _getAllFromDatabase();

  Stream<List<Country>> _getAllFromDatabase() {
    Stream<List<CountryEntity>> countries = _dao.watchCountries();
    return countries.map((streamedList) => streamedList
        .map((entity) =>
            CountryMapper.fromEntity(entity).copyWith(isFavourite: true))
        .toList());
  }

  Future<void> addCountry(Country country) async {
    country.isFavourite = true;
    await _dao.insertCountry(CountryMapper.toEntity(country));
  }

  Future<void> deleteCountry(Country country) async {
    country.isFavourite = false;
    await _dao.deleteCountry(country.id);
  }
}
