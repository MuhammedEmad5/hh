import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../data/repositories/splash_repo_impl.dart';
import '../domain/use_cases/get_first_time_open_app_use_case.dart';
import '../domain/use_cases/get_language_use_case.dart';
import '../domain/use_cases/set_first_time_open_app_use_case.dart';
import '../domain/use_cases/set_initial_branch_use_case.dart';
import '../domain/use_cases/set_initial_company_use_case.dart';
import '../domain/use_cases/set_initial_user_use_case.dart';
import '../presentation/manager/splash_cubit.dart';

class SplashService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<SfManager>(() => SfManager());

    sl.registerLazySingletonSafely<SplashRepo>(
          () => SplashRepo(LocalConnection(), sl()),
    );

    sl.registerLazySingletonSafely<GetFirstTimeOpenAppUseCase>(
          () => GetFirstTimeOpenAppUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<SetFirstTimeOpenAppUseCase>(
          () => SetFirstTimeOpenAppUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<SetInitialBranchUseCase>(
          () => SetInitialBranchUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<SetInitialCompanyUseCase>(
          () => SetInitialCompanyUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<SetInitialUserUseCase>(
          () => SetInitialUserUseCase(
        sl(),
      ),
    );
    sl.registerLazySingletonSafely<GetLanguageUseCase>(
          () => GetLanguageUseCase(
        sl(),
      ),
    );


    sl.registerLazySingletonSafely<SplashCubit>(
          () => SplashCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
            sl(),
      ),
    );
  }
}
