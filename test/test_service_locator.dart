import 'package:country_info_app/data/local/dao/country_dao.dart';
import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:country_info_app/data/remote/endpoints/fake_api_service.dart';
import 'package:country_info_app/domain/features/add_favourite.dart';
import 'package:country_info_app/domain/features/delete_favourite.dart';
import 'package:country_info_app/domain/features/load_countries.dart';
import 'package:country_info_app/domain/features/load_favourites.dart';
import 'package:country_info_app/domain/repositories/country_repository.dart';
import 'package:country_info_app/domain/utils/connectivity_manager.dart';
import 'package:country_info_app/presentation/pages/countries/countries_scoped_model.dart';
import 'package:country_info_app/presentation/pages/country_info/country_info_scoped_model.dart';
import 'package:country_info_app/presentation/pages/favourites/favourites_scoped_model.dart';
import 'package:get_it/get_it.dart';

import 'domain/utils/connectivity_manager_fake.dart';

GetIt locator = GetIt.instance;

void setupTestLocator() {
  //region data layer

  //region database
  locator.registerLazySingleton<DBService>(() => DBService.test(),
      dispose: (database) async {
    await database.transaction(() async {
      for (final table in database.allTables) {
        await database.delete(table).go();
      }
    });
    await database.close();
  });
  //endregion

  //region API
  locator.registerLazySingleton<FakeAPIService>(
      () => FakeAPIService.getInstance());
  //endregion

  //region daos
  locator.registerLazySingleton<CountryDAO>(
      () => CountryDAO(locator<DBService>()));
  //endregion

  //region endpoints
  locator.registerLazySingleton<CountryEndpoint>(
      () => CountryEndpoint(locator<FakeAPIService>()));
  //endregion

  //endregion

  //region domain layer

  locator.registerLazySingleton<ConnectivityManager>(() => ConnectivityManagerFake());

  //region repository
  locator.registerLazySingleton<CountryRepository>(() =>
      CountryRepository(locator<CountryDAO>(), locator<CountryEndpoint>(), locator<ConnectivityManager>()));
  //endregion

  //region use cases
  locator.registerFactory<AddFavouriteUseCase>(
      () => AddFavouriteUseCase(locator<CountryRepository>()));
  locator.registerFactory<DeleteFavouriteUseCase>(
      () => DeleteFavouriteUseCase(locator<CountryRepository>()));
  locator.registerFactory<LoadCountriesUseCase>(
      () => LoadCountriesUseCase(locator<CountryRepository>()));
  locator.registerFactory<LoadFavouritesUseCase>(
      () => LoadFavouritesUseCase(locator<CountryRepository>()));
  //endregion

  //endregion

  //region presentation layer

  //region scoped models
  locator.registerFactory<CountryInfoScopedModel>(() => CountryInfoScopedModel(
      locator<AddFavouriteUseCase>(), locator<DeleteFavouriteUseCase>()));
  locator.registerFactory<FavouritesScopedModel>(
      () => FavouritesScopedModel(locator<LoadFavouritesUseCase>()));
  locator.registerFactory<CountriesScopedModel>(
      () => CountriesScopedModel(locator<LoadCountriesUseCase>()));
  //endregion

  //endregion
}

void tearDownTestLocator() {
  locator.reset();
}