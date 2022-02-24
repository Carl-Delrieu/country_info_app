import 'package:country_info_app/data/local/db_service.dart';
import 'package:country_info_app/data/remote/endpoints/country_endpoint.dart';
import 'package:get_it/get_it.dart';

import 'data/local/dao/country_dao.dart';
import 'data/remote/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //region data layer
  locator.registerLazySingleton<DBService>(() => DBService(),
      dispose: (database) async {
    await database.close();
  });

  locator.registerLazySingleton<APIService>(() => APIService.defaultClient());

  //region daos
  locator.registerLazySingleton<CountryDAO>(
      () => CountryDAO(locator<DBService>()));
  //endregion

  //region endpoints
  locator.registerLazySingleton<CountryEndpoint>(
      () => CountryEndpoint(locator<APIService>()));
  //endregion

  //endregion

  //region domain layer
  //endregion

  //region presentation layer
  //endregion
}
