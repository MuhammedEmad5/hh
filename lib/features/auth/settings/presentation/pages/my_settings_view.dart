import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_event.dart';
import '../../../../../core/blocs/connection_type_bloc/connection_state.dart';
import '../../../../../core/blocs/language_bloc/language_event.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sf_keys.dart';
import '../../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../../../../../core/enums/connection_enum.dart';
import '../../../../../core/presentation/views/example_view.dart';
import '../../../../../core/presentation/widgets/bootstrap/text_box_bootstrap.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_controller.dart';
import '../../../../../core/presentation/widgets/dropdown_with_controller/custom_dropdown_with_controller.dart';
import '../../../../../core/presentation/widgets/submit_button.dart';
import '../../../../../core/presentation/widgets/toast_notification.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../shared/di/shared_service.dart';
import '../../../login/presentation/widgets/hint_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/models/settings_connection/setting_connection_model.dart';
import '../manager/settings_cubit.dart';
import '../widgets/db_names_drop_down.dart';

class MySettingsView extends StatefulWidget {
  const MySettingsView({super.key});

  @override
  State<MySettingsView> createState() => _MySettingsViewState();
}

class _MySettingsViewState extends State<MySettingsView> {
  late CustomDropdownController connectionTypeDropDownController;
  late CustomDropdownController protocolDropDownController;
  late CustomDropdownController dbNamesDropDownController;
  late TextEditingController apiTargetController;
  late TextEditingController instanceNameController;
  late SubmitButtonController getAllDbButtonController;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();

    initControllers();
    initButtons();
    getSettingsFromSharedPreference();
    updateControllersValues(null);

  }

  @override
  void dispose() {
    super.dispose();

    connectionTypeDropDownController.dispose();
    protocolDropDownController.dispose();
    dbNamesDropDownController.dispose();
    apiTargetController.dispose();
    instanceNameController.dispose();
    // getAllDbButtonController.dispose();
  }

  void getSettingsFromSharedPreference() {
    context.read<SettingsCubit>().getSettingsConnection(
        SfKeys.settingConnection);
  }

  void initControllers() {
    connectionTypeDropDownController = CustomDropdownController();
    protocolDropDownController = CustomDropdownController();
    dbNamesDropDownController = CustomDropdownController();
    apiTargetController = TextEditingController();
    instanceNameController = TextEditingController();
  }

  void initButtons() {
    getAllDbButtonController = SubmitButtonController();
  }

  void handleConnectionChange() {
    if (connectionTypeDropDownController.value == ConnectionEnum.server) {
      context
          .read<ConnectionTypeBloc>()
          .add(ChangeConnectionTypeEvent(ConnectionEnum.server));

      setState(() {});
    } else {
      context
          .read<ConnectionTypeBloc>()
          .add(ChangeConnectionTypeEvent(ConnectionEnum.local));


      setState(() {});


    }
  }

  void updateControllersValues(SettingConnection? settingConnection) {
    if (settingConnection != null) {
      LoggerSingleton.logger
          .w("${settingConnection.connectionType} inFINCTIOOON");

      settingConnection.connectionType == ConnectionEnum.server.toString()
          ? connectionTypeDropDownController.value = ConnectionEnum.server
          : connectionTypeDropDownController.value = ConnectionEnum.local;

      LoggerSingleton.logger
          .w("${connectionTypeDropDownController.value} controller");

      protocolDropDownController.value = settingConnection.protocol;
      dbNamesDropDownController.value = settingConnection.databaseName;
      apiTargetController.text = settingConnection.apiTarget;
      instanceNameController.text = settingConnection.instanceName;
      handleConnectionChange();
      return;
    }
    connectionTypeDropDownController = CustomDropdownController(
        context
            .read<ConnectionTypeBloc>()
            .state
            .connection);
    protocolDropDownController.value = "http";
    dbNamesDropDownController.value = "";
    apiTargetController.text = "10.147.17.29:3000";
    instanceNameController.text = ".";
  }

  void onGetAllDbPressed() {
    context.read<SettingsCubit>().getAllDb();
  }

  void saveSettings() {
    context.read<SettingsCubit>().savaSettingConnection(
        SfKeys.settingConnection,
        SettingConnection(
            connectionType: connectionTypeDropDownController.value.toString(),
            protocol: protocolDropDownController.value.toString(),
            apiTarget: apiTargetController.text,
            instanceName: instanceNameController.text,
            databaseName:
            dbNamesDropDownController.value ?? "No Data base available"));

    connectionTypeDropDownController.value == ConnectionEnum.server ?
    SharedService().initDi(RemoteConnection())
        : SharedService().initDi(LocalConnection());


    showToast(
        context: context,
        message: appLocalizations.save,
        backgroundColor: AppColors.primaryColor);
  }

  void validateInput() {
    final validator = Validator(context);
    final validateApiTarget =
    validator.validate(apiTargetController.text.trim(), "api target");
    final validateInstanceName =
    validator.validate(instanceNameController.text.trim(), "instance name");

    if (validateApiTarget != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateApiTarget,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    if (validateInstanceName != null) {
      showToast(
        duration: 4,
        context: context,
        message: validateInstanceName,
        backgroundColor: AppColors.redColor,
      );
      return;
    }
    saveSettings();
  }

  void onSaveSettingPressed() {
    if (connectionTypeDropDownController.value == ConnectionEnum.server) {
      validateInput();
      return;
    }
    saveSettings();
  }

  @override
  Widget build(BuildContext context) {

    appLocalizations = AppLocalizations.of(context)!;
    dbNamesDropDownController.value = appLocalizations.no_db_available;



    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.settings,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDropdownWithController(
          title: AppLocalizations.of(context)!.select_database,
          controller: connectionTypeDropDownController,
          titleColor: Colors.white,
          items: const [
            DropdownMenuItem(
              value: ConnectionEnum.local,
              child: Text(
                "Locale - داخلي",
              ),
            ),
            DropdownMenuItem(
              value: ConnectionEnum.server,
              child: Text(
                "Server - خارجي",
              ),
            ),
          ],
          onChanged: (value) {
            handleConnectionChange();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<ConnectionTypeBloc, ConnectionTypeState>(
          builder: (context, state) {
            initButtons();
            return Visibility(
              visible: state.connection == ConnectionEnum.server
                  ? true
                  : false,
              child: Column(
                children: [
                  CustomDropdownWithController(
                    title: AppLocalizations.of(context)!.protocol,
                    controller: protocolDropDownController,
                    titleColor: Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: 'http',
                        child: Text('http://'),
                      ),
                      DropdownMenuItem(
                        value: 'https',
                        child: Text('https://'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBoxBootstrap(
                    controller: apiTargetController,
                    label: AppLocalizations.of(context)!.api_target,
                    labelColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBoxBootstrap(
                    controller: instanceNameController,
                    label: AppLocalizations.of(context)!.instance_name,
                    labelColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<SettingsCubit, SettingsState>(
                    listener: (context, state) {
                      state.whenOrNull(
                          successSettingConnection: (settings) =>
                              updateControllersValues(settings));
                    },
                    builder: (context, state) {
                      getAllDbButtonController.reset();

                      return Column(
                        children: [
                          SubmitButton(
                            controller: getAllDbButtonController,
                            onPressed: () => onGetAllDbPressed(),
                            isExpanded: false,
                            color: AppColors.buttonRedColor,
                            buttonHeight: 30,
                            title:
                            AppLocalizations.of(context)!.retrieve_database,
                          ),
                          const SizedBox(height: 20),
                          state is SuccessFetchDataBase
                              ? DbNamesDropDown(
                            names: state.dbNames,
                            dbNamesDropDownController:
                            dbNamesDropDownController,
                          )
                              : DbNamesDropDown(
                              names: [
                                dbNamesDropDownController.value ??
                                    "No Data base avilable"
                              ],
                              dbNamesDropDownController:
                              dbNamesDropDownController),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () => onSaveSettingPressed(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: Colors.white,
          ),
          child: Text(
            AppLocalizations.of(context)!.save_settings.toUpperCase(),
            style: const TextStyle(
              color: AppColors.buttonRedColor,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const HintView(),
      ],
    );
  }
}
