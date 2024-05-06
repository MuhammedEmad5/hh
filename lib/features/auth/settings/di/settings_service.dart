import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../data/repositories/settings_repo_impl.dart';
import '../domain/use_cases/get_settings_connection_use_case.dart';
import '../domain/use_cases/read_all_db_use_case.dart';
import '../domain/use_cases/save_settings_connection_use_case.dart';
import '../presentation/manager/settings_cubit.dart';

class SettingsService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<SfManager>(() => SfManager());

    sl.registerLazySingletonSafely<SettingsRepo>(
      () => SettingsRepo(RemoteConnection(), sl()),
    );

    sl.registerLazySingletonSafely<ReadAllDbUseCase>(
      () => ReadAllDbUseCase(
        settingsRepo: sl(),
      ),
    );

    sl.registerLazySingletonSafely<SaveSettingConnectionUseCase>(
      () => SaveSettingConnectionUseCase(sl()),
    );
    sl.registerLazySingletonSafely<GetSettingConnectionUseCase>(
      () => GetSettingConnectionUseCase(sl()),
    );

    sl.registerLazySingletonSafely<SettingsCubit>(
      () => SettingsCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
