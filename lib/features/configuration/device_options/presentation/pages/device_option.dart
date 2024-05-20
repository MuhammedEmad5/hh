import 'package:InvoiceF/core/presentation/widgets/app_bar.dart';
import 'package:InvoiceF/core/presentation/widgets/check_box_with_controller/check_box_controller.dart';
import 'package:InvoiceF/core/presentation/widgets/loader_widget.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/manager/device_option_cubit.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/blue_label_Widget.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/default_Check_box.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/default_text_box_widget.dart';
import 'package:InvoiceF/features/configuration/device_options/presentation/widgets/suffix_icons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/presentation/widgets/card.dart';
import '../../../../../core/presentation/widgets/custom_error_widget.dart';
import '../../domain/entities/device_option_entity/device_option_entity_model.dart';
import '../widgets/drop_down_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceOptionView extends StatefulWidget {
  const DeviceOptionView({super.key});

  @override
  State<DeviceOptionView> createState() => _DeviceOptionViewState();
}

class _DeviceOptionViewState extends State<DeviceOptionView> {
  late CustomCheckboxController isTouchUiModeChecked;
  late CustomCheckboxController isShowStatusBarChecked;
  late CustomCheckboxController isWarningOnApplicationExitChecked;
  late CustomCheckboxController isAskForDataBaseBackupChecked;
  late TextEditingController filterFromDaysController;
  late TextEditingController touchScaleFactorController;
  late TextEditingController first80mmPcLogoIconController;
  late TextEditingController firstA4PcLogoIconController;
  late TextEditingController second80mmPcLogoIconController;
  late TextEditingController secondA4PcLogoIconController;
  late TextEditingController selectedDataFilter;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    isTouchUiModeChecked = CustomCheckboxController(false);
    isShowStatusBarChecked = CustomCheckboxController(false);
    isWarningOnApplicationExitChecked = CustomCheckboxController(false);
    isAskForDataBaseBackupChecked = CustomCheckboxController(false);
    filterFromDaysController = TextEditingController();
    touchScaleFactorController = TextEditingController();
    first80mmPcLogoIconController = TextEditingController();
    firstA4PcLogoIconController = TextEditingController();
    second80mmPcLogoIconController = TextEditingController();
    secondA4PcLogoIconController = TextEditingController();
    selectedDataFilter = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
    isTouchUiModeChecked.dispose();
    isShowStatusBarChecked.dispose();
    isWarningOnApplicationExitChecked.dispose();
    isAskForDataBaseBackupChecked.dispose();
    filterFromDaysController.dispose();
    touchScaleFactorController.dispose();
    first80mmPcLogoIconController.dispose();
    firstA4PcLogoIconController.dispose();
    second80mmPcLogoIconController.dispose();
    secondA4PcLogoIconController.dispose();
    selectedDataFilter.dispose();
  }

  void saveDeviceOption() {
    DeviceOptionEntity deviceOptionEntity = DeviceOptionEntity(
      filterFromDays: int.tryParse(filterFromDaysController.text),
      dataFilter: selectedDataFilter.text,
      touchScaleFactor: touchScaleFactorController.text,
      touchUIMode: isTouchUiModeChecked.value,
      showStatusBar: isShowStatusBarChecked.value,
      warningOnApplicationExit: isWarningOnApplicationExitChecked.value,
      askForDatabaseBackup: isAskForDataBaseBackupChecked.value,
      first80mmPCLogoIcon: first80mmPcLogoIconController.text,
      firstA4PCLogoIcon: firstA4PcLogoIconController.text,
      second80mmPCLogoIcon: second80mmPcLogoIconController.text,
      secondA4PCLogoIcon: secondA4PcLogoIconController.text,
    );
     context
        .read<DeviceOptionCubit>()
        .saveDeviceOptionObject(deviceOptionEntity);
  }


  void handleSuccess(DeviceOptionEntity deviceOption) {
    updateTextFields(deviceOption);
  }

  void updateTextFields(DeviceOptionEntity deviceOption) {
    isTouchUiModeChecked.value = deviceOption.touchUIMode ?? false;
    isShowStatusBarChecked.value = deviceOption.showStatusBar ?? false;
    isWarningOnApplicationExitChecked.value =
        deviceOption.warningOnApplicationExit ?? false;
    isAskForDataBaseBackupChecked.value =
        deviceOption.askForDatabaseBackup ?? false;
    filterFromDaysController.text =
        deviceOption.filterFromDays.toString() ?? '';
    selectedDataFilter.text = deviceOption.dataFilter ?? appLocalizations.all;
    touchScaleFactorController.text = deviceOption.touchScaleFactor ?? appLocalizations.all;
    first80mmPcLogoIconController.text = deviceOption.first80mmPCLogoIcon ?? "";
    firstA4PcLogoIconController.text = deviceOption.firstA4PCLogoIcon ?? "";
    second80mmPcLogoIconController.text =
        deviceOption.second80mmPCLogoIcon ?? "";
    secondA4PcLogoIconController.text = deviceOption.secondA4PCLogoIcon ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: appLocalizations.device_options,
        color: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
        saveBtnColor: AppColors.onPrimary,
        onSavePressed: () => saveDeviceOption(),
      ),
      body: BlocBuilder<DeviceOptionCubit, DeviceOptionState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => Center(child: Loader()),
            success: (deviceOption) {
              handleSuccess(deviceOption);
              return buildContent();
            },
            error: (e) => CustomErrorWidget(
              errorMessage: e,
            ),
            empty: () =>buildContent(),
          );
        },
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCard(
        child: SingleChildScrollView(
          child: FB5Row(
            classNames: 'px-xs-1 px-lg-custom-10 mt-1 ',
            children: [
              FB5Col(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.general_data_filter),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.filter_from_days,
                      controller: filterFromDaysController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionDropdownWidget(
                      controller: selectedDataFilter,
                      appLocalizations: appLocalizations,
                    ),
                    const SizedBox(height: 15),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.touch),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.touch_scale_factor,
                      controller: touchScaleFactorController,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionCheckBoxWidget(
                      controller: isTouchUiModeChecked,
                      label: appLocalizations.touch_ui_mode,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.main_form),
                    const SizedBox(height: 10),
                    DeviceOptionCheckBoxWidget(
                      controller: isShowStatusBarChecked,
                      label: appLocalizations.show_status_bar,
                    ),
                    DeviceOptionCheckBoxWidget(
                      controller: isWarningOnApplicationExitChecked,
                      label: appLocalizations
                          .warning_on_application_exit,
                    ),
                    DeviceOptionCheckBoxWidget(
                      controller: isAskForDataBaseBackupChecked,
                      label: appLocalizations.ask_for_database_backup,
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.head_icon),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label:
                      appLocalizations.first_80_mm_pc_logo_icon,
                      controller: first80mmPcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {
                          context.read<DeviceOptionCubit>().pickImage(first80mmPcLogoIconController);
                        },
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.first_a4_pc_logo_icon,
                      controller: firstA4PcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {
                          context.read<DeviceOptionCubit>().pickImage(firstA4PcLogoIconController);
                        },
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionBlueLabelWidget(
                        label: appLocalizations.footer_icon),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label:
                      appLocalizations.second_80_mm_pc_logo_icon,
                      controller: second80mmPcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {
                          context.read<DeviceOptionCubit>().pickImage(second80mmPcLogoIconController);
                        },
                        plusFunction: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    DeviceOptionTextBoxWidget(
                      label: appLocalizations.second_a4_ac_logo_icon,
                      controller: secondA4PcLogoIconController,
                      suffix: DeviceOptionSuffixIconWidget(
                        moreFunction: () {
                          context.read<DeviceOptionCubit>().pickImage(secondA4PcLogoIconController);
                        },
                        plusFunction: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
