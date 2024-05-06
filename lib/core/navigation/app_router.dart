import 'dart:io';
import 'package:InvoiceF/core/navigation/routes.dart';
import 'package:InvoiceF/features/shared/presentation/views/bottom_navigation_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/repositories/login_repo_impl.dart';
import '../../features/auth/login/di/login_service.dart';
import '../../features/auth/login/presentation/manager/login_cubit.dart';
import '../../features/auth/login/presentation/pages/login_settings_view.dart';
import '../../features/auth/settings/data/repositories/settings_repo_impl.dart';
import '../../features/auth/settings/di/settings_service.dart';
import '../../features/auth/settings/domain/use_cases/get_settings_connection_use_case.dart';
import '../../features/auth/settings/domain/use_cases/read_all_db_use_case.dart';
import '../../features/auth/settings/domain/use_cases/save_settings_connection_use_case.dart';
import '../../features/auth/settings/presentation/manager/settings_cubit.dart';
import '../../features/auth/splash/data/repositories/splash_repo_impl.dart';
import '../../features/auth/splash/di/splash_service.dart';
import '../../features/auth/splash/presentation/manager/splash_cubit.dart';
import '../../features/auth/splash/presentation/pages/splash_view.dart';
import '../constants/sf_keys.dart';




class AppRouter {
  AppRouter();



    Route generateRoute(RouteSettings settings) {
      ///Note if you want to pass parameter in constructor
      ///this arguments to be passed in any screen like this ( arguments as ClassName )
      Object? arguments = settings.arguments;

      switch (settings.name) {
        case '/':
          return _buildPageRoute(
              builder: (context) {
                SettingsService().initDi();
                SplashService().initDi();


                return MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider(
                      create: (context) => GetIt.instance<SettingsRepo>(),
                    ),
                    RepositoryProvider(
                      create: (context) => GetIt.instance<SplashRepo>(),
                    ),
                  ],
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) =>
                        GetIt.instance<SettingsCubit>()
                          ..getSettingsConnection(SfKeys.settingConnection)

                        ,
                      ),


                      BlocProvider(
                        create: (context) =>
                        GetIt.instance<SplashCubit>()
                          ..getFirstTimeOpenApp(SfKeys.firstTimeOpenApp)
                          ..getLanguage(SfKeys.language)

                        ,
                      ),
                    ],
                    child: const SplashView(),
                  ),
                );
              }


          );

        case Routes.login:
          return _buildPageRoute(
              builder: (context) {
                SettingsService().initDi();
                LoginService().initDi();
                return MultiRepositoryProvider(
                  providers: [
                    RepositoryProvider(
                      create: (context) => GetIt.instance<SettingsRepo>(),
                    ),
                    RepositoryProvider(
                      create: (context) => GetIt.instance<LoginRepo>(),
                    ),
                  ],
                  child: MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: SettingsCubit(
                          GetIt.instance<ReadAllDbUseCase>(),
                          GetIt.instance<SaveSettingConnectionUseCase>(),
                          GetIt.instance<GetSettingConnectionUseCase>(),

                        ),
                      ),
                      BlocProvider(
                        create: (context) => GetIt.instance<LoginCubit>(),
                      ),
                    ],
                    child: const LoginSettingsView(),
                  ),
                );
              }


          );


        default:
          return _buildPageRoute(
            builder: (_) {
              return Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              );
            },
          );
      }
    }
    }


  Route _buildPageRoute({
    required WidgetBuilder builder,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
      builder: builder,
    )
        : MaterialPageRoute(
      builder: builder,
    );
  }

