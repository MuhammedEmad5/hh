import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/image_Manager.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../settings/data/models/settings_connection/setting_connection_model.dart';
import '../../../settings/data/repositories/settings_repo_impl.dart';
import '../../../settings/domain/use_cases/get_settings_connection_use_case.dart';
import '../../../settings/domain/use_cases/read_all_db_use_case.dart';
import '../../../settings/domain/use_cases/save_settings_connection_use_case.dart';
import '../../../settings/presentation/pages/my_settings_view.dart';
import 'login_view.dart';

class LoginSettingsView extends StatefulWidget {
  final SettingConnection? settingConnection;

  const LoginSettingsView({

    super.key,
    this.settingConnection,
  });

  @override
  State<LoginSettingsView> createState() => _LoginSettingsViewState();
}

class _LoginSettingsViewState extends State<LoginSettingsView> {
  bool _isSettings = false;

  @override
  void initState() {
    super.initState();

    //  LoggerSingleton.logger.e("${widget.settingConnection} in login_Setting");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FB5Row(
            classNames: 'px-xs-3 px-lg-custom-10 mt-3 ',
            children: [
              FB5Col(
                child: Column(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(ImagesManager.appIcon),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextStyle(
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .login
                                .toUpperCase(),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .settings
                                .toUpperCase(),
                          ),
                        ],
                      ),
                    ),
                    Switch.adaptive(
                      value: _isSettings,
                      onChanged: (value) {
                        setState(() {
                          _isSettings = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      thumbColor: const MaterialStatePropertyAll(
                        AppColors.primaryColor,
                      ),
                      inactiveThumbColor: AppColors.primaryColor,
                      activeTrackColor: AppColors.primaryColor.withAlpha(150),
                      inactiveTrackColor: AppColors.primaryColor.withAlpha(
                          150),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _isSettings
                          ? const MySettingsView()
                          : const LoginView(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
