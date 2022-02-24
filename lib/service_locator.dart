import 'package:get_it/get_it.dart';

import 'package:country_info_app/data/local/db_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //region data layer
  locator.registerLazySingleton<DBService>(() => DBService(),
      dispose: (database) async {
        await database.close();
      });

  locator.registerLazySingleton<APIService>(() => APIService());

  //region daos
  locator.registerLazySingleton<CountryDAO>(() =>
      CountryDAO(locator<DBService>()));
  //endregion

  //region endpoints
  locator.registerLazySingleton<>(() => null);
  //endregion

  //endregion

  //region domain layer
  //endregion

  //region presentation layer
  //endregion
}