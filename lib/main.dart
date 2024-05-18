import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb ;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/blocs/connection_type_bloc/connection_bloc.dart';
import 'core/blocs/connection_type_bloc/connection_state.dart';
import 'core/blocs/language_bloc/language_bloc.dart';
import 'core/blocs/language_bloc/language_state.dart';
import 'core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import 'core/data/datasources/remote_data_source/remote_connection.dart';
import 'core/navigation/app_router.dart';
import 'core/navigation/navigation.dart';
import 'core/utils/logger.dart';
import 'features/shared/di/shared_service.dart';


///******* Important Notes*************
/// To Change the connection type from remote to local by change the object that pass to Shared Service
/// in main build  from LocalConnection() to RemoteConnection().
/// To Change Language go to Language bloc and change the default that pass to it in the constructor

void main() async {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    SharedService().initDi(RemoteConnection());

    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (_) => LanguageBloc(),
        ),
        BlocProvider<ConnectionTypeBloc>(
          create: (_) => ConnectionTypeBloc(),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ConnectionTypeBloc, ConnectionTypeState>(
            builder: (context, connectionTypeState) {
              return FlutterBootstrap5(
                builder: (ctx) => MaterialApp(
                  restorationScopeId: "test",
                  navigatorKey: AppNavigation.key,
                  supportedLocales: const [
                    Locale('en'),
                    Locale('ar'),
                  ],
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  locale: Locale(languageState.languageCode),
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.blueAccent,
                    ),
                    useMaterial3: true,
                  ),
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRouter().generateRoute,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
