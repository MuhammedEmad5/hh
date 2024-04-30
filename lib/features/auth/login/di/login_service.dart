import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/datasources/connection.dart';
import '../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../data/repositories/login_repo_impl.dart';
import '../domain/use_cases/login_use_case.dart';
import '../domain/use_cases/save_language_use_case.dart';
import '../presentation/manager/login_cubit.dart';

class LoginService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<SfManager>(
      () => SfManager(),
    );
    sl.registerLazySingletonSafely<LoginRepo>(
      () => LoginRepo(sl(),sl()),
    );

    sl.registerLazySingletonSafely<LoginUseCase>(
      () => LoginUseCase(loginRepo: sl()),
    );
    sl.registerLazySingletonSafely<SaveLanguageUseCase>(
      () => SaveLanguageUseCase( sl()),
    );

    sl.registerLazySingletonSafely<LoginCubit>(
      () => LoginCubit(
        sl(),
        sl()
      ),
    );
  }
}
