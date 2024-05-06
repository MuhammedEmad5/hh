import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_event.dart';
import '../../../../../core/blocs/language_bloc/language_bloc.dart';
import '../../../../../core/blocs/language_bloc/language_event.dart';
import '../../../../../core/constants/image_Manager.dart';
import '../../../../../core/constants/sf_keys.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../../core/enums/connection_enum.dart';
import '../../../../../core/navigation/navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../../../core/presentation/views/example_view.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../shared/di/shared_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../settings/data/models/settings_connection/setting_connection_model.dart';
import '../../../settings/presentation/manager/settings_cubit.dart';
import '../manager/splash_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void onCheckForFirstTimeOpen(bool isFirstTime) {
    LoggerSingleton.logger.w(isFirstTime);

    if (isFirstTime) {
      navigateToLogin();

      context.read<SplashCubit>().setFirstTimeOpenApp(SfKeys.firstTimeOpenApp);
      context.read<SplashCubit>().setInitialValuesInDb();
    } else {
      navigateToLogin();
    }
  }

  void navigateToLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context != null) {
        Future.delayed(const Duration(seconds: 1), () {
          AppNavigation.pushReplacementNamedPageRoute(Routes.login);
        });
      }
    });
  }

  void assignConnectionType(SettingConnection? settingConnection) {
    if (settingConnection == null) {
      SharedService().initDi(LocalConnection());
      context
          .read<ConnectionTypeBloc>()
          .add(ChangeConnectionTypeEvent(ConnectionEnum.local));
      return;
    }
    if (settingConnection.connectionType == ConnectionEnum.server.toString()) {
      SharedService().initDi(RemoteConnection());
      context
          .read<ConnectionTypeBloc>()
          .add(ChangeConnectionTypeEvent(ConnectionEnum.server));
      return;
    }
    if (settingConnection.connectionType == ConnectionEnum.local.toString()) {
      SharedService().initDi(LocalConnection());
      context
          .read<ConnectionTypeBloc>()
          .add(ChangeConnectionTypeEvent(ConnectionEnum.local));
      return;
    }
  }

  void showErrorToast(String msg) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context != null) {
        showErrorToast(msg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagesManager.appIcon),
            const SizedBox(
              height: 50,
            ),
            const Text("Loading"),
            BlocListener<SettingsCubit, SettingsState>(
              listener: (context, state) {
                state.whenOrNull(successSettingConnection: (settingConnection) {
                  assignConnectionType(settingConnection);
                });
              },
              child: const SizedBox(),
            ),
            BlocListener<SplashCubit, SplashState>(
              listener: (context, state) {
                state.whenOrNull(
                    successGetFirstOpenBool: (isFirstTime) =>
                        onCheckForFirstTimeOpen(isFirstTime),
                    successSetInitialValues: () => navigateToLogin(),
                    successGetLanguage: (language) => context
                        .read<LanguageBloc>()
                        .add(ChangeLanguageEvent(language)),
                    error: (msg) => showErrorToast(msg));
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
