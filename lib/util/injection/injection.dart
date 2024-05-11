import 'package:arcibo/data/datasource/local/local_datasource.dart';
import 'package:arcibo/data/datasource/remote/base_api_client.dart';
import 'package:arcibo/data/datasource/remote/remote_datasource.dart';
import 'package:arcibo/data/service/base_hive_service.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

Future<void> initInjection() async {
  di
    //#region SOURCE
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSource(
        apiClient: di(),
      ),
    )
    ..registerLazySingleton<LocalDataSource>(
      () => LocalDataSource(
        hiveService: di(),
      ),
    )
    //#endregion SOURCE

    //#region CORE
    ..registerLazySingleton<BaseApiClient>(
      () => BaseApiClient(
        hive: di(),
      ),
    )
    ..registerLazySingleton<BaseHiveService>(
      BaseHiveService.new,
    );
  //#endregion CORE
}
