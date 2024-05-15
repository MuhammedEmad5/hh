import 'package:InvoiceF/core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/configuration/user_options/data/repositories/user_options_repo.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/use_cases/insert_list_theme_to_sf_use_case.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/use_cases/insert_page_theme_to_sf_use_case.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/use_cases/read_all_themes_use_case.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/use_cases/read_list_theme_from_sf_use_case.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/use_cases/read_page_theme_from_sf_use_case.dart';
import 'package:InvoiceF/features/configuration/user_options/presentation/manager/user_options_cubit.dart';
import 'package:get_it/get_it.dart';

class UserOptionsService {
  final sl = GetIt.instance;

  Future<void> initDi() async {

    sl.registerLazySingletonSafely<SfManager>(
          () => SfManager(),
    );
    sl.registerLazySingletonSafely<UserOptionsRepo>(
          () => UserOptionsRepo(sl(),sl()),
    );
    sl.registerLazySingletonSafely<ReadAllThemesUseCase>(
          () => ReadAllThemesUseCase( sl()),
    );
    sl.registerLazySingletonSafely<ReadListThemeUseCase>(
          () => ReadListThemeUseCase( sl()),
    );
    sl.registerLazySingletonSafely<ReadPageThemeUseCase>(
          () => ReadPageThemeUseCase( sl()),
    );
    sl.registerLazySingletonSafely<InsertListThemeUseCase>(
          () => InsertListThemeUseCase( sl()),
    );
    sl.registerLazySingletonSafely<InsertPageThemeUseCase>(
          () => InsertPageThemeUseCase( sl()),
    );

    sl.registerLazySingletonSafely<UserOptionsCubit>(
          () => UserOptionsCubit(
              sl(),
            sl(),
            sl(),
            sl(),
            sl()
          ),
    );
  }
}
